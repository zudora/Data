#!/usr/bin/perl -w

#purpose is to add a new 2nd column from input

#command-line input is string with filenames: file to clean up and string to insert

#get list of files
$file = shift;
$instext = shift;

#construct a new file name for output
$newfile = substr($file,0,length($file)-4) . "_textadded" . ".txt";
$msg = "name of new file is " . $newfile . "\n";
print $msg;

#open file
open (INPUT_FILE, $file)
    or die "Can't open $file for reading $!\n";

open (OUTPUT_FILE, '>', $newfile)
    or die "Can't open $newfile for reading $!\n";

print "files opened \n";

$iLines=0;
#for each row, insert the text

while(<INPUT_FILE>)
{
	$line = $_;
		$iLines++;
		if ($sQuery =~ /(.*)\t(\d*)/)
		{
			$sFirstWords = $1;
			$iCount = $2;
			$line =~ $sFirstWords + \t + $instext + \t + $iCount + \n;
		}	
	print OUTPUT_FILE $line;	
		
		if (($iLines % $iPrintIncrement) == 0)
		{
			print STDERR "Processing query list $iLines\n";
		}
}
close INPUT_FILE;
close OUTPUT_FILE;

print "done\n";
