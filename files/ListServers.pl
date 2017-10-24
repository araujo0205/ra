#!/usr/bin/perl
use 5.14.0;

use strict;
use warnings;

use JSON;
use FindBin qw( $RealBin );

#Inicio da lista de servidores
my %servers1 = (

    server1 => '1.1.1.1',
    server2 => '2.2.2.2'
);

my %servers2 = (
    server3 => '3.3.3.3',
    server4 => '4.4.4.4'
);

my %servers3 = (
    server5 => '5.5.5.5',
    server6 => '6.6.6.6'
);

my %servers4 = (
    server7 => '7.7.7.7',
    server8 => '8.8.8.8'
);
#fim da listagem

#listagem total do servidores
my %total_servers = (%servers1, %servers2,%servers3,%servers4);

my $sf;
my $json_text;
#Servidores 1
open($sf, '>', $RealBin . '/../public/json/servers_1.json');
$json_text = encode_json \%servers1;
print $sf $json_text;
close $sf;
#Servidores 2
open($sf, '>', $RealBin . '/../public/json/servers_2.json');
$json_text = encode_json \%servers2;
print $sf $json_text;
close $sf;
#Servidores 3
open($sf, '>', $RealBin . '/../public/json/servers_3.json');
$json_text = encode_json \%servers3;
print $sf $json_text;
close $sf;

#Servidores 4
open($sf, '>', $RealBin . '/../public/json/servers_4.json');
$json_text = encode_json \%servers4;
print $sf $json_text;
close $sf;

#Total Servidores
open($sf, '>', $RealBin . '/../public/json/servers.json');
$json_text = encode_json \%total_servers;
print $sf $json_text;
close $sf;




