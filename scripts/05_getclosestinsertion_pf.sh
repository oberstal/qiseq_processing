#!/bin/bash

# load bedtools
module purge
module load hub.apps/anaconda3/2020.11
source activate bedtools2.3

# sort bedfile by chromosome and coordinates
bedtools sort -i pb_sites.bed > pf.res.sorted.bed

# sort genome .gff file by chromosome and coordinates
# already sorted

# now get nearest gene for each insertion site (and report distance to the feature for each insertion. use negatives for upstream distances (that's the "-D" option))
	# run from directory your qiseq file is in
bedtools closest -D b -a *sorted.bed -b $HOME/projects/qiseq2021/ref/lmpp.smpp.insertions.master.08212020.JO.sorted.bed > 2022.pf.insertions.mapped.to.closest.feature.txt

