#!/bin/bash

#basic workflow:

#-format and combine TDO's qiseq output tables into a single bed file
#-extract 8bp centered on the called insertion coordinate for each insertion
#	** go ahead and keep all the rows for now, can filter ttaa in downstream analysis (in R)
# -sort the .bed file, then use bedtools to identify the closest pf insertion for each

# this is the pipeline for calling pf insertions in pooled phenotypic screening against the published lmpp/pilot clone insertion data (Science 2018. does not include saturation insertions)


#VARIABLES
SCRIPT_DIR=/home/j/jobersta/projects/qiseq2022/scripts

bash ${SCRIPT_DIR}/01_makepfcombinedbed.sh
wait $!

bash ${SCRIPT_DIR}/02_extract_ttaa_pf.sh
wait $!

bash ${SCRIPT_DIR}/03_rename_chr.sh
wait $!

# optional: run CW's liftover script (don't need to do this if just mapping against the published insertion data in chr1-14 format)
# bash ${SCRIPT_DIR}/04_runLiftover_OPTIONAL.sh

bash ${SCRIPT_DIR}/05_getclosestinsertion_pf.sh

