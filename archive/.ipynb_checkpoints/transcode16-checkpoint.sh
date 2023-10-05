#!/bin/bash

# Set the input directory path
input_dir="/om2/scratch/tmp/jsmentch/"

# Loop through all .wav files in the input directory and its subdirectories
find "$input_dir" -type f -name "*.wav" | while read file; do
    # Transcode the .wav file in place
    ffmpeg -i "$file" -acodec pcm_s16le -ar 16000 "$file"
done


#ffmpeg -i $F -acodec pcm_s16le -ar 16000 /om2/scratch/Thu/jsmentch/READ_bids/data/${SUB}/${SES}/${SUB}_${SES}_${OUTFILE}.wav