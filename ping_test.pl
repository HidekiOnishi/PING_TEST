#!/usr/bin/perl
######################################################
#
#		PING TEST Script
#
#		ping_test.pl
#
#		DENET.CO.,LTD
#
#	auther   : onishi@Midc 12/12/2011
#	update by: onishi@Midc 12/12/2011
#	usage    :./ping_test.pl <FileName>	
#
######################################################
use strict;
use warnings;

if(@ARGV == 0){
	print "Domain File Not Found.\n";
	print "Usage: ping_test.pl <FileName>\n";
	exit -1;
}

##Initialize section.##
my $count = 0;
my $domain_count = 0;
my @ping = ( );
open(IN,"< $ARGV[0]");
open(OUT,"> ping.txt");

while(<IN>){
	@ping = `ping -c 1 ${_}`;
	chomp $_;
	$count = length($_);
	print OUT $_;
	while($count < 64){
		print OUT "=";
		$count++;
	}
	print OUT "\n";
	print OUT $ping[1];
	print OUT "================================================================\n";
	print OUT "\n";
	$domain_count++;
}

print OUT "Number of domains:".$domain_count."\n";

close(IN);
close(OUT);

print "\n";
print "            -----------------------\n";
print "(*´ω｀*)< please check ping.txt! |\n";
print "            -----------------------\n";
print "\n";

exit 0;
