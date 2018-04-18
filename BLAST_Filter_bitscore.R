#!/usr/bin/env Rscript
# make this script executable by doing 'chmod +x DADA_Microbiome.R'
help =
  "
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Help text here
Arguments in this order:
1) Path to Directory storing reads
2) Path to DADA formatted 16S database

./BLAST_Filter.R /Path/to/BLAST/Results 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\n\n"

# Read options from command line
args = commandArgs(trailingOnly = TRUE)
if(is.element("--help", args) | is.element("-h", args) | is.element("-help", args) | is.element("--h", args)){
  cat(help,sep="\n")
  stop("\nHelp requested.")
}

## Load required libraries
#library(tidyverse)


## Read in FA file
df = read.csv(file = args[1], header = F, sep = '\t', stringsAsFactors = F)

colnames(df) = c('query_id', 'subject_id', 'identity', 'alignment_length', 'mismatches', 'gap_opens', 'q_start', 'q_end', 's_start', 's_end', 'evalue', 'bit_score')

df2 = df[df$bit_score >= 100,]

write.table(df2, file = "Bitscore_Threshold.txt", sep = '\t', quote = F, row.names = F)


