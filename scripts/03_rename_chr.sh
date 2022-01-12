#!/bin/bash

# uses the key in chrnames.txt to search and replace the "PfNF54" chromosome names with plain old "chr" names to use with CW's liftover script
# run in directory with pb_sites.bed (bed file with extracted nucleotides from insertion sites)


# this is the one to run most of the time, converting the NF54_m1 chromosome names to cw's "chr" convention
while read n k; do sed -i "s/$n/$k/g" pb_sites.bed; done < $HOME/projects/qiseq2021/scripts/chrnames.txt

# input .bed file is edited in place to the new plain chr1-14 names.

