#!/usr/bin/perl
######################################################
#
#               PING TEST Script
#
#                 ping_test.pl
#
#                DENET.CO.,LTD
#
#       auther   : onishi@Midc 12/12/2011
#       update by: onishi@Midc 14/12/2011
#       usage    :./ping_test.pl <FileName>
#
######################################################
use strict;
use warnings;
use Net::Ping;

if(@ARGV == 0){
        print "Domain File Not Found.\n";
        print "Usage: ping_test.pl <FileName>\n";
        exit -1;
}

##Initialize section.##
my $count = 0;
my $domain_count = 0;
my $success_count = 0;
my $error_count = 0;
my $ping;
my $timeout = 3;

$ping = Net::Ping->new("icmp");

open(IN,"< $ARGV[0]");
open(OUT,"> $ARGV[0]_ping.txt");

while(<IN>){
        chomp $_;
        $count = length($_);
        print OUT $_;
        while($count < 64){
                print OUT "=";
                $count++;
        }
        print OUT "\n";
        if( $ping->ping($_,$timeout) ){
                print OUT "$_ PING OK.\n";
                $success_count++;
        }else{
                print OUT "$_ PING NG.\n";
                $error_count++;
        }
        print OUT "================================================================\n";
        print OUT "\n";
        $domain_count++;
}

print OUT "Number of domains:".$domain_count."\n";
print OUT "Number of success:".$success_count."\n";
print OUT "Number of error  :".$error_count."\n";

$ping->close();
close(IN);
close(OUT);

print "\n";
print "            -------------";

$count = length($ARGV[0]);
while($count > 0){
        print "-";
        $count--;
}

print "-----------\n";
print "(*´ω｀*)< please check $ARGV[0]_ping.txt! |\n";
print "            -------------";

$count = length($ARGV[0]);
while($count > 0){
        print "-";
        $count--;
}

print "-----------\n";
print "\n";

exit 0;