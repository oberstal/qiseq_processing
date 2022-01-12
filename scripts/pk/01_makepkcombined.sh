#!/bin/bash
# take output from TDO qiseq insertion-calling pipeline and map to nearest geneID
# background notes:
    # input column 1 = normalized reads
    # input column 2 = a hash for insertion-ID? not sure how to decode if that's what it is
    # input column 3 = chr
    # input column 4 = insertion coord

    # filename indicates the sample name

# Pseudocode:
    # step 1: add sample name as a column to each insertions file so that they can be combined into a single file
        # take sample name from filename, add a column to file for sample name
    # step 2: cat all together
    # make input into a bed file
        # take columns 3 and 4 from input, add third column with "stop" coord (column 2 + 2bp)
    # step 3: run samtools of merged bed file against bed of proper gff file to get nearest feature and distance to nearest feature


# example file name: Res.PB-[samplename].5prim_[genus].txt

# written to be run in same directory as raw data files from TDO qiseq pipeline

# try dif windows of coords to extract sequence from in later step. started with 4, not enough. Window will be half the window, so i want 8bp i'll put 4.
## Doesn't work, hard to call numeric variables in awk. just do by hand ffs



WINDOW=8


mkdir ./tmp

for f in *_Pkn.txt
do
  SHORTNAME=$(basename $f ".5prim_Pkn.txt")
  echo ${SHORTNAME}

  # add a tab and the sample-name to each row in the file
  sed -i "s/$/\t${SHORTNAME}/" $f
  # change column order for all, and add a column for end of insertion site so i can easily extract the 4 bpTTAA insertion-site (to co    nfirm insertion is ttaa site) 
  # try wider window to extract, 4bp isn't enough	  
  
  #awk -v WINDOW="$WINDOW" 'BEGIN {print $3 "\t" $4 - WINDOW "\t" $4 + WINDOW "\t" $5 "\t" $1 "\t" $2}' $f > ./tmp/$f.tmp

  awk '{print $3 "\t" $4-4 "\t" $4+4 "\t" $5 "\t" $1 "\t" $2}' $f > ./tmp/$f.tmp
done

wait


cat ./tmp/*.tmp > pk_pb_${WINDOW}bp_intermed.bed

grep -e "^P" *intermed.bed > pk_pb.${WINDOW}bp.bed

#wait

rm *intermed.bed

#wait

#cat *Pf.txt > pf_pb.bed


## move combined bed file into directory above
##mv intermed.bed ../

### change column order for all, and add a column for end of insertion site so i can easily extract the 4 bpTTAA insertion-site (to confirm insertion is ttaa site)
###awk '{print $3 "\t" $4 "\t" $4+3 "\t" $5 "\t" $1 "\t" $2}' *Pf.txt > intermed.bed

# keep only the lines that start with "P" (because the Plasmodium chromo names start with P; gets rid of the single lines at the tops of the files)
#grep -e "^P" intermed.bed > pf_pb.bed


