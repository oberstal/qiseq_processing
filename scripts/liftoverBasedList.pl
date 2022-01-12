#!/usr/bin/perl

use strict;
use warnings;

my ($listFile, $bedFile, $numColBed) = @ARGV;

system "intersectBed -a $bedFile -b $listFile -wa -wb > outFile";

open FILE, "outFile" or die "can't open $!";
while (my $ele = <FILE>) {
       chomp($ele);
       my ($chr, $startB, $endB, $startLI, $endLI, $startLII, $endLII) = 
       (split /\t/, $ele)[0,1,2,$numColBed + 1, $numColBed + 2, $numColBed+3, $numColBed+4];
       my $infBed = join "\t", (split /\t/, $ele)[3..$numColBed-1];

       my $newCordinate = extract($chr, $startB, $endB, $startLI, $endLI, $startLII, $endLII);
       print "$newCordinate\t$infBed\n";
}
close(FILE);

sub
extract{
     my ($chr, $startB, $endB, $startLI, $endLI, $startLII, $endLII) = @_;
     my ($newStart, $newEnd) = ();
     if ($startB >= $startLI &&
         $endB <= $endLI) {
	 my $headDis = $startB - $startLI;
	 my $endDis = $endLI - $endB;
	 $newStart = $startLII + $headDis;
	 $newEnd = $endLII - $endDis;
     } elsif ($startB < $startLI &&
              $endB > $endLI) {
	 $newStart = $startLII;
	 $newEnd = $endLII; 
     } elsif ($startB < $startLI) {
	 my $dis = $endB - $startLI;
         $newStart = $startLII;
	 $newEnd = $startLII + $dis;
     } elsif ($endB > $endLI) {
	 my $dis = $endLI - $startB;
         $newStart = $endLII - $dis;
	 $newEnd = $endLII;
     }
     return ("$chr\t$newStart\t$newEnd");
}
