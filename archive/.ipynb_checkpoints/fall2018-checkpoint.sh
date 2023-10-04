#!/bin/bash

for file in ../CZF_Media_20230621/Scores/20181024/*; do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    IFS='-' read -ra ADDR <<< "$filename"
    for i in "${ADDR[@]}"; do
        echo "$i"
    done
done
EOF
