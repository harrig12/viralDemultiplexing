#!/bin/bash

# Demultiplexing script. From an annotation file containing barcodes to search for,
# sort reads from input file into new files based on barcode. Name output files
# with the name of the barcode that matched. 

# Note: barcode file should end with a newline
# Sanity check: also output a file that records index in sequence that the barcode matched.

# Author: Cait Harrigan
# Email: cait.harrigan@mail.utoronto.ca
# Date: Dec 16 2019

# ======================================

# For each barcode search reads for forward and rev complement

# defaults
barcodeFile="annotation/exBarcode.txt"
inputFile="data/exNanopore.fastq"
prefix=""
outDir="output"

# flags for excluding header
header=true
firstLine=true

# possibly overwrite defaults with cmd flags
source "src/flagHandling.sh"

while read -u 19 line; do

	# exclude the header if present
	if ($header && $firstLine); then
		firstLine=false
		continue
	fi

	# split on name, fwd and rev barcode elements
	barcode=($(echo "$line" | tr ',' '\n'))
	name=${barcode[0]}
	fwd=${barcode[1]}
	rev=${barcode[2]}

	echo "processing barcode $name ..."

	# name output file
	mkdir -p "${outDir}/${prefix}${name}"
	outputFile="${outDir}/${prefix}${name}/${prefix}${name}.fastq"

	#search the forward barcode and print to output file
	fwdHits=($(grep -n "$fwd" $inputFile | cut -f1 -d:))

	for i in "${fwdHits[@]}"; do
		sed -n -f <(seq $(($i - 1)) $(($i + 2)) | sed 's/$/p/') $inputFile >> $outputFile
	done

	#search the reverse barcode and print to output file
	revHits=($(grep -n "$rev" $inputFile | cut -f1 -d:))

	for i in "${revHits[@]}"; do
		sed -n -f <(seq $(($i - 1)) $(($i + 2)) | sed 's/$/p/') $inputFile >> $outputFile
	done

done 19<$barcodeFile


# [END]
