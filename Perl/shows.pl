use strict;
use warnings;

open(OUTFILE, '>C:\Users\v-betsy\Documents\Flash_Result.out') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsy\Documents\Flash_Result_1617240.tsv') or die "Unable to open input file: $!";

#my $line;

while(my $line = <INPUTFILE>)
	{
	
        chomp($line);

	#s/\t*$//;           # eat redundant \t at end
	#s/\"//g;

	#print OUTFILE "$line";
	#print OUTFILE "$_\n";
	
	if($line !~ m/adobe|flashblock/)
	{
		print OUTFILE "$line\n";
		#print OUTFILE "$_\n";
	}

	#some queries contain commas. Only use this on tsv or pre-filter or split
	#my($qDate, $normQ, $qLevel, $qPerc, $rawQ, $qvc) = split '\t';

#	if($normQ !~ m/abobe|flashblock/)
#		{
#		print OUTFILE "$qDate\t";
#		print OUTFILE "$normQ\t";
#		print OUTFILE "$qLevel\t";
#		print OUTFILE "$qPerc\t";
#		print OUTFILE "$rawQ\t";
#		print OUTFILE "$qvc\n";
#		}
	}
close(INPUTFILE);
close(OUTFILE);