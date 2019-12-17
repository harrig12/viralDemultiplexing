#!/bin/bash

# Script to run demultiplexing on all files in a folder

# Author: Cait Harrigan
# Email: cait.harrigan@mail.utoronto.ca
# Date: Dec 16 2019

# ======================================

# have two rounds of splitting, first look for starting barcodes
# second look for ending barcodes

# step 1
tmpDir="step1"

for file in data/*; do
	echo "processing file $file ..."
	bash src/demultiplex.sh -in ${file} -out ${tmpDir} -a "annotation/barcodes_step1.txt"
done 

# step 2
finalDir="step2"

for file in $tmpDir/*; do

	p=$(echo $file | cut -f1 -d. | cut -f2 -d/)
	file="${tmpDir}/${p}/${p}.fastq"
	
	echo "processing file $file ..."
	bash src/demultiplex.sh -prefix "${p}_" -in ${file} -out ${finalDir} -a "annotation/barcodes_step2.txt" 
done

rm -rf $tmpDir
mv $finalDir output

# [END]
