use strict;
use warnings;
use Text::CSV;

open(OUTFILE, '>C:\Users\v-betsy\Documents\Result_1329378_shorter2.out') or die "Unable to open output file for write: $!";

open(INPUTFILE, '<C:\Users\v-betsy\Downloads\Result_1329378.csv') or die "Unable to open input file: $!";

my $csv = Text::CSV->new or                                                                         
   croak "Cannot use CSV: " . Text::CSV_XS->error_diag();



