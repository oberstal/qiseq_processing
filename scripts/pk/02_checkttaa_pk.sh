#!/bin/bash

# if you need to check sequence of insertion-site:
# ref for pk: $HUB/References/Pknowlesi/*.fasta
# ref for cp: $HUB/References/Cryptosporidium/Cparvum/CryptoDB-52_CparvumIowaII_Genome.fasta

# output goes to stdout; direct to file at commandline
#REF=$HUB/References/Cryptosporidium/Cparvum/CryptoDB-52_CparvumIowaII_Genome.fasta

REF=$HUB/References/Pknowlesi/*.fasta
BEDIN=$HOME/projects/qiseq2021/data/from_tdo/pk/*.bed


bedtools getfasta -fi ${REF} -bed ${BEDIN} -tab > seq.col

paste ${BEDIN} seq.col > pb_sites.bed
