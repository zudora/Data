use strict;
use warnings;

open(INPUTFILE, '<C:\tools\Win8bing_100113to100713_export.txt') or die "Unable to open input file: $!";

open(OUTFILE, '>C:\tools\win81_best.txt') or die "Unable to open output file: $!";

my($ident);
my($imps);
while(<INPUTFILE>)
	{	
	
	#my($line) = $_;
	#chomp($line);
	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
	
	chomp;
	my($query, $field2,$field3,$field4,$imps) = split("\t");
	
	if ($query =~ m/bing/i or $query =~ m/windows/i or $query =~ m/8.1/i )
		{
		if ($query =~ m/bing/i ){$ident="bing";}
		if ($query =~ m/windows/i ){$ident="windows";}
		if ($query =~ m/8.1/i ){$ident="8.1";}
		print OUTFILE "$query\t";
		print OUTFILE "$imps\t";
		print OUTFILE "$ident\n";

		}

	}
close(INPUTFILE);
close(OUTFILE);

open(INPUTFILE, '<C:\tools\win8bing_100113to100713.txt') or die "Unable to open input file: $!";

open(OUTFILE, '>C:\tools\win81_remainder.txt') or die "Unable to open output file: $!";

while(<INPUTFILE>)
	{	
	
	#my($line) = $_;
	#chomp($line);
	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
	
	chomp;
	my($query, $field2,$field3,$field4,$imps) = split("\t");
	if ($query !~ m/bing/i and $query !~ m/windows/i and $query !~ m/8.1/i )
		{
		print OUTFILE "$query\t";
		print OUTFILE "$imps\n";

		}

	}
close(INPUTFILE);
close(OUTFILE);

open(INPUTFILE, '<C:\tools\win81_remainder.txt') or die "Unable to open input file: $!";

open(OUTFILE, '>C:\tools\win81_less_Likely.txt') or die "Unable to open output file: $!";

while(<INPUTFILE>)
	{	
	
	#my($line) = $_;
	#chomp($line);
	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
	
	chomp;
	my($query, $imps) = split("\t");
	if ($query =~ m/surface/i or $query =~ m/search/i or $query =~ m/charm/i or $query =~ m/win/i  or $query =~ m/blue/i )
		{
		if ($query =~ m/surface/i ){$ident="surface";}
		if ($query =~ m/search/i ){$ident="search";}
		if ($query =~ m/charm/i ){$ident="charm";}
		if ($query =~ m/win/i ){$ident="win";}
		if ($query =~ m/blue/i ){$ident="blue";}
		print OUTFILE "$query\t";
		print OUTFILE "$imps\t";
		print OUTFILE "$ident\n";
		}

	}
close(INPUTFILE);
close(OUTFILE);

open(INPUTFILE, '<C:\tools\win81_remainder.txt') or die "Unable to open input file: $!";

open(OUTFILE, '>C:\tools\win81_endremainder.txt') or die "Unable to open output file: $!";

while(<INPUTFILE>)
	{	
	
	#my($line) = $_;
	#chomp($line);
	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
	
	chomp;
	my($query, $imps) = split("\t");
	if ($query !~ m/surface/i and $query !~ m/search/i and $query !~ m/charm/i and $query !~ m/win/i  and $query !~ m/blue/i )
		{
		print OUTFILE "$query\t";
		print OUTFILE "$imps\n";

		}

	}
close(INPUTFILE);
close(OUTFILE);
