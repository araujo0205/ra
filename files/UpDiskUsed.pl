#!/usr/bin/perl
use 5.14.0;

use strict;
use warnings;

use Net::OpenSSH;
use Data::Dumper;
use JSON;
use FindBin qw( $RealBin );

UpDiskUsed('servers_1.json','diskused_servers_1.json');
UpDiskUsed('servers_2.json','diskused_servers_2.json');
UpDiskUsed('servers_3.json','diskused_servers_3.json');
UpDiskUsed('servers_4.json','diskused_servers_4.json');

sub UpDiskUsed {
    my ($file_server,$file_diskused) = @_;
    
    my $filename = $RealBin . '/../public/json/' . $file_server;
    open(my $sf, '<:encoding(UTF-8)', $filename)
	or die "Não foi possível abrir o arquivo '$filename' $!";
    
    my $serversJson = <$sf>;
    my $serversRef = decode_json $serversJson;
    my %servers = %$serversRef;

    my @server;
    my @diskused;
    while ( my ($server, $ip) = each(%servers) ) {
	my $ssh = Net::OpenSSH->new($server);
	my $stdout = $ssh->capture({tty => 1},'df -h / | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+"');
	chomp($stdout);
	$stdout = ($stdout =~ s/\r//gr) + 0;
	push @server, $server;
	push @diskused, $stdout;
	print "$server:$stdout\n";
    }

    my %list_diskused = (
	"servidores" => \@server,
	"valores" => \@diskused,
	);
    open(my $mqf, '>', $RealBin . '/../public/json/' . $file_diskused);
    my $json_text = encode_json \%list_diskused;
    print $mqf $json_text;
    close $mqf;

}
