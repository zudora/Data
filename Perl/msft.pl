use strict;
use warnings;

open(INPUTFILE, '<C:\tools\win81_endremainder.txt') or die "Unable to open input file: $!";

open(OUTFILE, '>C:\tools\win81_msft.txt') or die "Unable to open output file: $!";

while(<INPUTFILE>)
	{	
	
	#my($line) = $_;
	#chomp($line);
	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
	
	chomp;
	my($query, $imps) = split("\t");
	if ($query =~ m/microsoft/i or $query =~ m/msft/i or $query =~ m/microsfot/i)
		{
		print OUTFILE "$query\t";
		print OUTFILE "$imps\n";

		}

	}
close(INPUTFILE);
close(OUTFILE);