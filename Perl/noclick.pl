use strict;
use warnings;

#using filterurls as base


open(INPUTFILE, '<C:\tools\nflanswers1.out') or die "Unable to open output file for write: $!";

open(OUTFILE, '>>C:\tools\nflanswers1-click.out') or die "Unable to open input file: $!";

#print OUTFILE"\t";

		my($edge);
		my($imps);
		my($qname);
		my($sep);
		my($clicks);
		my($ansclicks);
		my($sports);
		
		print OUTFILE "Query\t" . "imps\t" . "Total Clicks\t" . "Answer Clicks\t" . "Sports Answer\n";

while (<INPUTFILE>)
	{
	#my($line) = $_;
	#chomp($line);
	# chomp;
	# my($query,$imps,$click,$algoclick,$url,$urlclick,$fill1,$fill2) = split("\t");

	# if($url !~ m/www.pcworld.com/ and $url !~ m/www.huffingtonpost.com/ and $url !~m/www.myspace.com/)
		# {
		# print OUTFILE "$query\t";
		# print OUTFILE "$imps\t";
		# print OUTFILE "$click\t";
		# print OUTFILE "$algoclick\t";
		# print OUTFILE "$url\t";
		# print OUTFILE "$urlclick\t";
		# print OUTFILE "$fill1\t";
		# print OUTFILE "$fill2\n";
		# }
		($qname)="";
		($imps)="";
		($edge)="";
		($clicks)="";
		($ansclicks)="";
		($sports)="";
		

		my($line) = $_;
		chomp($line);
		my $length = length($line);

		
		if($line =~ m/^Query:/)
			{
			$qname = substr $line, 8, ($length - 9);	
			print OUTFILE "\n$qname\t";
			}
			
		if ($line =~ m/^Impressions   = /)
			{
			$imps = substr $line, 17, ($length -18);
			print OUTFILE "$imps\t";
			}
			
		if ($line =~ m/^Total Clicks  =/)
			{

			$clicks = substr $line, 17, ($length -18);
			print OUTFILE "$clicks\t";

			}
			
		if ($line =~ m/^Answer Clicks =/)
			{

			$ansclicks = substr $line, 17, ($length -18);
			print OUTFILE "$ansclicks\t";

			}	
		
		if ($line =~ m/SportsAnswer/)
			{

			print OUTFILE "$line\t";

			}	
	#queryfind sequence:
	# 	break query string and write to outfile on new line
	#	if at any time a new query is found, stop and fill all values, then move on
	#	look for impressions. If found, break string and store
	#	look for url1. If found, break string and store URL and clicks
	#	look for url2. If found, break string and store URL and clicks
	#	insert found data onto same line as query in outfile, with tabs so that empties get recorded.
	#	move on to look for next query
	
	
	}
close(INPUTFILE);
close(OUTFILE);