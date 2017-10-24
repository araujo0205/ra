#!/usr/bin/perl
use 5.14.0;

use strict;
use warnings;

use Net::OpenSSH;
use Data::Dumper;
use JSON;
use FindBin qw( $RealBin );

UpInfoMQueue('servers_1.json','mailqueue_servers_1.json'); 
UpInfoMQueue('servers_2.json','mailqueue_servers_2.json'); 
UpInfoMQueue('servers_3.json','mailqueue_servers_3.json'); 
UpInfoMQueue('servers_4.json','mailqueue_servers_4.json'); 

sub UpInfoMQueue {
    my ($file_server,$file_mailqueue) = @_;

    my $filename = $RealBin . '/../public/json/' . $file_server;
    open(my $sf, '<:encoding(UTF-8)', $filename)
	or die "Não foi possível abrir o arquivo '$filename' $!";
    
    my $serversJson = <$sf>;
    my $serversRef = decode_json $serversJson;
    my %servers = %$serversRef;

    my @server;
    my @mailqueue;
    while ( my ($server, $ip) = each(%servers) ) {
	my $ssh = Net::OpenSSH->new($server);
	my $stdout = $ssh->capture({tty => 1},"exim -bpc");
	chomp($stdout);
	$stdout = ($stdout =~ s/\r//gr) + 0;
	push @server, $server;
	push @mailqueue, $stdout;
	print "$server:$stdout\n";
    }

    my %list_mailqueue = (
	"servidores" => \@server,
	"valores" => \@mailqueue,
	);
    
    open(my $mqf, '>', $RealBin . '/../public/json/' . $file_mailqueue)
	or die "Não foi possível abrir o arquivo '$filename' $!";
    my $json_text = encode_json \%list_mailqueue;
    print $mqf $json_text;
    close $mqf;
}
