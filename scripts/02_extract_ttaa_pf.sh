#!/bin/bash

# if you need to check sequence of insertion-site:
# ref for pk: $HUB/References/Plasmodium/Pknowlesi/*.fasta
# ref for cp: $HUB/References/Cryptosporidium/Cparvum/CryptoDB-52_CparvumIowaII_Genome.fasta
# ref for pf: $HUB/References/Plasmodium/Pfalciparum/*.fasta


module purge
module load hub.apps/anaconda3/2020.11
source activate bedtools2.3

# output goes to stdout; direct to file at commandline
#REF=$HUB/References/Cryptosporidium/Cparvum/CryptoDB-52_CparvumIowaII_Genome.fasta

#REF=$HUB/References/Plasmodium/Pfalciparum/*.fasta
#BEDIN=$HOME/projects/qiseq2021/results/chr_rev/*.bed

# to extract directly from nf54 genome before coordinate liftover:
REF=/home/j/jobersta/projects/qiseq2021/scripts/liftover_extras/extras/nf54/PfNF54.fasta
#BEDIN=$HOME/projects/qiseq2021/results/*.bed
BEDIN=pf_pb.bed 

bedtools getfasta -fi ${REF} -bed ${BEDIN} -tab > seq.col
# bedtools getfasta -fi /home/j/jobersta/projects/qiseq2021/scripts/liftover_extras/extras/nf54/PfNF54.fasta -bed $HOME/projects/qiseq2021/results/*.bed -tab > seq.col
paste ${BEDIN} seq.col > pb_sites.bed
