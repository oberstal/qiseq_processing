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
mkdir ./tmp

for f in *_Cparvum.txt
do
  SHORTNAME=$(basename $f ".5prim_Cparvum.txt")
  echo ${SHORTNAME}

  # add a tab and the sample-name to each row in the file
  sed -i "s/$/\t${SHORTNAME}/" $f
  # change column order for all, and add a column for end of insertion site so i can easily extract the 4 bpTTAA insertion-site (4bp upstream and 4bp downstream centered on insertion coord to confirm insertion is ttaa site) 
  awk '{print $3 "\t" $4-4 "\t" $4+4 "\t" $5 "\t" $1 "\t" $2}' $f > ./tmp/$f.tmp
done

wait


cat ./tmp/*.tmp > cp_pb_intermed.bed

grep -e "^C" cp_pb_intermed.bed > cp_pb.bed

rm *intermed.bed

#wait

#cat *Pf.txt > pf_pb.bed


## move combined bed file into directory above
##mv intermed.bed ../

### change column order for all, and add a column for end of insertion site so i can easily extract the 4 bpTTAA insertion-site (to confirm insertion is ttaa site)
###awk '{print $3 "\t" $4 "\t" $4+3 "\t" $5 "\t" $1 "\t" $2}' *Pf.txt > intermed.bed

# keep only the lines that start with "P" (because the Plasmodium chromo names start with P; gets rid of the single lines at the tops of the files)
#grep -e "^P" intermed.bed > pf_pb.bed


