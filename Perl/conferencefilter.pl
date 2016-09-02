use strict;
#use warnings;

open(OUTFILE, '>C:\Users\v-betsy\Documents\Result_1329092_shorter.out') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsy\Downloads\Result_1329092.csv') or die "Unable to open input file: $!";
;

while(<INPUTFILE>)
	{
	chomp;
	#s/\t*$//;           # eat redundant \t at end
	s/\"//g;

	#some queries contain commas. Only use this on tsv
	my($qDate, $normQ, $qLevel, $qPerc, $rawQ, $qvc) = split ',';

	if($normQ =~ m/tournament|basketball|conference/)
		{
		print OUTFILE "$qDate\t";
		print OUTFILE "$normQ\t";
		print OUTFILE "$qLevel\t";
		print OUTFILE "$qPerc\t";
		print OUTFILE "$rawQ\t";
		print OUTFILE "$qvc\n";
		}
	}
close(INPUTFILE);
close(OUTFILE);