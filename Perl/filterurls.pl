use strict;
use warnings;

open(OUTFILE, '>C:\Users\v-betsyl\Documents\Illegal downloads\Illegal downloads new version_copied070913_betsy_filtered2.out') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsyl\Documents\Illegal downloads\Illegal downloads new version_copied070913_betsy_filtered.out') or die "Unable to open input file: $!";
;

while(<INPUTFILE>)
	{
	chomp;
	my($query,$imps,$click,$algoclick,$url,$urlclick,$fill1,$fill2) = split("\t");

	if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
		{
		print OUTFILE "$query\t";
		print OUTFILE "$imps\t";
		print OUTFILE "$click\t";
		print OUTFILE "$algoclick\t";
		print OUTFILE "$url\t";
		print OUTFILE "$urlclick\t";
		print OUTFILE "$fill1\t";
		print OUTFILE "$fill2\n";
		}
	}
close(INPUTFILE);
close(OUTFILE);