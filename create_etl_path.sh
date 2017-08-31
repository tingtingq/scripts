#!/bin/bash

input="./input.csv"

echo "----start creating etl directories----"

while IFS=',' read -r i1 i2
do  
    cd $HOME/csv/
    mkdir -p $i1 && chmod -R 777 $i1
    mkdir -p $i1/$i2 && chmod -R 777 $i1/$i2
    echo "----directories created for $i1, $i2----"
done < "$input"

