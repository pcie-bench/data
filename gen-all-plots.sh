#!/bin/sh

# Execute nfp-gen-plots.sh in each data directory

for d in nfp6000-*; do
    echo
    echo
    echo $d

    (cd $d; ../nfp-gen-plots.sh)
done
