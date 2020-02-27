#!/bin/bash
# Script name: ex2.sh
for i in `seq 1 1000`
do
    for var in $* 
    do
        echo "command line contains: $var"
    done
done
