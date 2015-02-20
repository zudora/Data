use strict;
use warnings;

open(OUTFILE, '>C:\Users\v-betsy\OneDrive\Code_backup\Perl\Result_1291209cleaned.tsv') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsy\OneDrive\Code_backup\Perl\Result_1291209 NASCAR drivers current testcopy.tsv') or die "Unable to open input file: $!";
;



while(<INPUTFILE>)
	{
	

    chomp;               # eat the \r\n at the end of the strin
    s/\t*$//;           # eat redundant \t at end

	print OUTFILE "$_\n";
		
	}

close(INPUTFILE);
close(OUTFILE);

	#chomp($fdata);
	
	#my($queryDate, $rawQ, $normQ, $ql, $qp, $qvc) = split("\t");

	#print OUTFILE "$queryDate\t";
	#print OUTFILE "$rawQ\t";
	#print OUTFILE "$normQ\t";
	#print OUTFILE "$ql\t";
	#print OUTFILE "$qp\t";
	#print OUTFILE "$qvc\n";


		#my $fdata;
	#$fdata .= $_;
	#$fdata =~ s/\t*$//g;
	#	$fdata =~ s/\t+/\t/g;  