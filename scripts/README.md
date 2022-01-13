# QIseq processing pipeline

basic workflow:

  - format and combine TDO's qiseq output tables into a single bed file
  - extract 8bp centered on the called insertion coordinate for each insertion

	** go ahead and keep all the rows for now, can filter ttaa in downstream analysis (in R)
-sort the .bed file, then use bedtools to identify the closest pf insertion for each


## quickstart

run the runQIseqProcessingPipeline.sh script from the directory containing TDO's qiseq output tables. No arguments, nothing fancy. 

  * edit the SCRIPT_DIR variable to wherever the scripts are. 
  * also edit the mapping script (#5) to wherever the insertions bed file is located.
      * there could be other sloppy hardcoded pieces that I've forgotten. Easter eggs!


## notes

There are several scripts here, and some include additional documentation on what they actually do. The "pipeline.sh" script in its current form is for Pf analysis. 

The Pk/Cp directories have example scripts for running on Pk and Cp.



