# viralDemultiplexing
Quick and dirty scripts to demultiplex a set of nanopore reads. Approach is written for (short) viral sequences, and intended for further post-processing. (ie. no guarantees on robustness)

## Example usage 
Run bash scripts from the command line. `demultiplex.sh` will sort input reads to a set of new files, based on passed barcodes. Barcode annotation should provide a name, forward sequence, and reverse sequence in csv format (see exUsage/annotation). `batchData.sh` will call `demultiplex.sh` for all files in a directory.

Try it out: 

```
# Clone the repo
git clone https://github.com/harrig12/viralDemultiplexing.git
cd viralDemultiplexing

cp -r exUsage/* .
bash src/batchData.sh
```

In the output directory, there will be a separate file for each named starting barcode and ending barcode. 

