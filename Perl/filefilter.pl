use strict;
use warnings;

open(OUTFILE, '>C:\Users\v-betsyl\Documents\illegal3_or_more.out') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsyl\Documents\illegaldownload_June2013wk1and2.txt') or die "Unable to open input file: $!";
;

while(<INPUTFILE>)
	{
	#my($line) = $_;
	#chomp($line);
	chomp;
	my($query, $imps,$num2,$num3,$url,$num4) = split("\t");
	if ($imps>3)
		{
		print OUTFILE "$query\t";
		print OUTFILE "$imps\t";
		print OUTFILE "$url\n";
		}
	}
close(INPUTFILE);
close(OUTFILE);