#!/bin/bash
# note: may not need to run this script unless doing fresh extraction from genome gff file. If you are instead mapping against the "chr" bedfile of insertions--don't run this. proceed directly after running the rename script to running the getclosestinsertion script.

# using CW's old script for converting between nf54 and 3d7 (version 9.0; no differences in chromosome length from current annotation)
# usage according to CW:

	# perl liftoverBasedList.pl <plasmodium_NF54to3D7.list> <bed file> <column in bed file>
		## the "column in bedfile" argument is unclear--but may mean column number when indexed from 0, in which case 5 is right (I had 6 columns in bedfile, no other number worked).
	# outputs a file "outFile" with a few coordinates--looks to be more like a key for what was done. --the first 4 columns are NF54to3D7.list, and the rest look to be the new calculated coordinates for each insertion (3D7 coordinates).
# I don't know if that's right or not, but the actual coordinates that make sense are what are printed to screen. so capture in a file.

perl liftoverBasedList.pl ../../data/pf_pb_sorted_renamed.bed plasmodium_NF54to3D7.list 5 > pf_pb_3d7_out.bed
