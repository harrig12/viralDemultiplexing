# viralDemultiplexing
Quick and dirty scripts to demultiplex a set of nanopore reads. Approach is written for (short) viral sequences, and intended for further post-processing. (ie. no guarantees on robustness)

## Example usage 
Run bash scripts from the command line. `demultiplex.sh` will sort input reads to a set of new files, based on passed barcodes. Barcode annotation should provide a name, forward sequence, and reverse sequence in csv format (see exUsage/annotation). `batchData.sh` will call `demultiplex.sh` for all files in a directory.

Try it out: 

```
# Clone the repo
git clone https://github.com/harrig12/viralDemultiplexing.git
cd viralDemultiplexing

# Run on the example data as a batch
cp -r exUsage/* .
bash src/batchData.sh
```

In the created output directory, there will be a separate file for each named starting barcode and ending barcode. You can see that there are two samples tagged with barcodes N707 and S507, and they will both be written to the same file. 

## Advanced usage 

`demultiplex.sh` can be called directly with the following flags

```
-a (annotation) file to use as barcode annotation
-in (in file) fastq file with reads to demultiplex
-out (out destination) directory to output resulting files to
-prefix (file name prefix) appended to front of result file name
-header (true or false) whether the barcode annotation file has a header or not (default true)
```
