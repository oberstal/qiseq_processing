#!/bin/bash

# load bedtools
module purge
module load hub.apps/anaconda3/2020.11
source activate bedtools2.3

# sort bedfile by chromosome and coordinates
bedtools sort -i *sites.bed > cp.res.sorted.bed

# sort genome .gff file by chromosome and coordinates
# already sorted
GFF=/shares/omicshub/References/Cryptosporidium/Cparvum/Cparvum.sorted.gff


# now get nearest gene for each insertion site (and report distance to the feature for each insertion. use negatives for upstream distances (that's the "-D" option))


	# run from directory your qiseq file is in
bedtools closest -D b -a *sorted.bed -b $GFF > 2021.cp.insertions.mapped.to.closest.feature.txt

