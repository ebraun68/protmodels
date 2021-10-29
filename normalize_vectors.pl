#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

############################################################################
# Normalize a vector to sum to one. Expects a tab delimited file with the
# first column corresponding to a label and the remaining elements on each
# line corresponding to the values to normalize. Will output a normalized
# file to stdout
############################################################################

############################################################################
# Set the global variables
############################################################################
my($progname) = $0;

my($iter);
my($jter);
my($kter);
my($lter);
my($mter);
my($nter);
my($qter);

my($yter);
my($zter);

my($tempch1);
my($tempch2);
my($tempvar);
my($tempstr);
my @temparray;

my($verbose) = 0;

if ( @ARGV != 1 ) {
	print STDERR "Usage:\n  \$ $progname <infile>\n";
	print STDERR "  infile  = iqtree output file for GTR20 analysis\n";
	print STDERR "will send normalized data to stdout\n\n";
	print STDERR "exiting...\n";
	exit;
}

my($infile)  = $ARGV[0];
my($outfile) = $ARGV[1];

############################################################################
# Read the inputfile (.iqtree file)
############################################################################
my @inlist;
open (my $INF, "$infile") or die "Could not open file $infile for input.\n";
@inlist = <$INF>; # Read the tab-delimited file of R matrices
close($INF) or die "Could not close file $infile\n";
my($inlistnum) = $#inlist + 1;

# Remove all trailing endlines
for ($iter=0; $iter<$inlistnum; $iter++) { chomp($inlist[$iter]); }

############################################################################
# Extract and output the rate matrix data
############################################################################
my($elements);
my @sum;

# Calculate sums of all elements for each vector
for ($iter=0; $iter<$inlistnum; $iter++) { 
	(@temparray) = split(/\s+/, $inlist[$iter]);
	$elements = $#temparray + 1;
	$sum[$iter] = 0;
	for ($jter=1; $jter<$elements; $jter++) {
		$sum[$iter] += $temparray[$jter];
	}
}

# Output the normalized vectors
for ($iter=0; $iter<$inlistnum; $iter++) { 
	(@temparray) = split(/\s+/, $inlist[$iter]);
	$elements = $#temparray + 1;
	print "$temparray[0]";
	for ($jter=1; $jter<$elements; $jter++) {
		$tempvar = $temparray[$jter] / $sum[$iter] ;
		print "\t$tempvar";
	}
	print "\n";
}




