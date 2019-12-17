#!/bin/bash

while test $# -gt 0; do
        case "$1" in
             -a)
                 shift
                 barcodeFile=$1
                 shift
                 ;;
             -in)
                 shift
                 inputFile=$1
                 shift
                 ;;
             -prefix)
                 shift
                 prefix=$1
                 shift
                 ;;
             -out)
                 shift
                 outDir=$1
                 shift
                 ;;
             -header)
                 shift
                 header=$1
                 shift
                 ;;
             *)
                echo "$1 is not a recognized flag!"
                return 1;
                ;;
       esac
done


