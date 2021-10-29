#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

############################################################################
# Calculate Euclidean distances among a set of R matrices
#
# The tab-delimited text file with R matrix elements should have one matrix
# per row. The first value in each row should be the rate matrix name
#
# Can be used for vectors with any number of elements (e.g., equilibrium
# amino acid frequencies, etc)
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
	print STDERR "  infile = tab-delimited file with R matrices\n";
	print STDERR "exiting...\n";
	exit;
}

my($infile) = $ARGV[0];

############################################################################
# Read the inputfile (a tab-delimited file with R matrix data)
############################################################################
my @inlist;
open (my $INF, "$infile") or die "Could not open file $infile for input.\n";
@inlist = <$INF>; # Read the tab-delimited file of R matrices
close($INF) or die "Could not close file $infile\n";
my($matrices) = $#inlist + 1;

# Remove all trailing endlines
for ($iter=0; $iter<$matrices; $iter++) { chomp($inlist[$iter]); }

@temparray = split(/\s+/, $inlist[0]);
my($elements) = @temparray - 1;

print "#NEXUS\n\n";
print "[ Calculating Euclidean distance matrix for $matrices exchangeability (R) matrices with $elements elements ]\n\n";

# Initialize the distance matrix array
my($totalsize) = $matrices * $matrices; # Size of the 2D array
my @distancemat;
for ($iter=0; $iter<$totalsize; $iter++) { $distancemat[$iter] = 0; }

# Save the names of the R matrices
my @names;
my($maxnamelen) = 11;
for ($iter=0; $iter<$matrices; $iter++) {
	(@temparray) = split(/\s+/, $inlist[$iter]);
	$names[$iter] = $temparray[0];
	if ( length($names[$iter]) > $maxnamelen ) { $maxnamelen = length($names[$iter]); }
}

############################################################################
# Calculate the Euclidean distances
############################################################################
my @matrix1;
my @matrix2;
my @sqdiff;
my($sumsq);

for ($iter=0; $iter<$matrices; $iter++) {
	for ($jter=0; $jter<$matrices; $jter++) {
		if ( $iter == $jter ) { $distancemat[matrix_element($iter,$jter,$matrices)] = 0.0; }
		else { # do the Euclidean distance calculation
			$sumsq = 0;
			# transfer the first R matrix to @matrix1 and the second to @matrix2
			(@matrix1) = split(/\s+/, $inlist[$iter]);
			(@matrix2) = split(/\s+/, $inlist[$jter]);
			for ($zter=0; $zter<$elements; $zter++) { 
				$sqdiff[$zter] = ( $matrix1[$zter+1] - $matrix2[$zter+1] ) * ( $matrix1[$zter+1] - $matrix2[$zter+1] );
				$sumsq = $sumsq + $sqdiff[$zter];
			}
			$distancemat[matrix_element($iter,$jter,$matrices)] = sqrt($sumsq);	
		} # end else ...
	} # end for ($jter=0; $jter<$matrices ...
} # end for ($iter=0; $iter<$matrices ...

############################################################################
# Output the distance matrix
############################################################################

print "Begin Distances;\n";
print "\tDimensions Newtaxa NTax = $matrices ;\n";
print "\tFormat Triangle = Both ;\n";
print "Matrix\n";

for ($iter=0; $iter<$matrices; $iter++) {
	print "$names[$iter]  ";
	$tempvar = $maxnamelen - length($names[$iter]);
	for ($jter=0; $jter<$tempvar; $jter++) { print " "; }
	for ($jter=0; $jter<$matrices; $jter++) {
		if ( $distancemat[matrix_element($iter,$jter,$matrices)] == 0 ) {
			print "  0.0000000000000000";
		}
		else {
			print "  $distancemat[matrix_element($iter,$jter,$matrices)]";
		}
	}
	print "\n";
}

print "\t;\nEnd;\n\n";

exit;
############################################################################
# End of main program, subroutines follow
############################################################################



############################################################################
# Return array coordinates
############################################################################
sub matrix_element {
	my($ith,$jth,$localmultiplier) = @_;
	my($localmat) = ($ith * $localmultiplier) + $jth;
	return $localmat;
}
