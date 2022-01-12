#!/bin/bash

# load bedtools
#module purge
#module load hub.apps/anaconda3/2020.11
#source activate isafe

REF=$HUB/References/Pknowlesi/*sorted*.gff

# sort bedfile by chromosome and coordinates

bedtools sort -i *sites.bed > pk.res.8bp.sites.sorted.bed

# sort genome .gff file by chromosome and coordinates
# already sorted

# now get nearest gene for each insertion site (and report distance to the feature for each insertion. use negatives for upstream distances (that's the "-D" option))
	# run from directory your qiseq file is in
bedtools closest -D b -a *sorted.bed -b ${REF} > 2021.pk.insertions.8bp.mapped.to.closest.feature.txt

