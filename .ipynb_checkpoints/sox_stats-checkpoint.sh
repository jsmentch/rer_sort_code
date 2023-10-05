#!/bin/bash

# Set the input directory path
input_dir="/om/tmp/jsmentch/rer_kaggle/data"

# Loop through all .wav files in the input directory and its subdirectories
find "$input_dir" -type f -name "*.wav" | while read file; do
    # Set the output file path
    output_file="$(echo "$file" | sed 's|.wav$|_sox_stats.txt|')"

    # Run the sox command on the .wav file
    sox "$file" -n stats &> "$output_file"
done
