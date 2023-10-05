#!/bin/bash

# Set the input directory path
input_dir="/om/tmp/jsmentch/rer_kaggle"

# Loop through all .wav files in the input directory and its subdirectories
find "$input_dir" -type f -name "*.wav" | while read file; do
    # Transcode the .wav file in place
    mv $file temp.wav
    ffmpeg -y -i temp.wav -acodec pcm_s16le -ar 16000 "$file"
    rm temp.wav
done
#ffmpeg -i $F -acodec pcm_s16le -ar 16000 /om2/scratch/Thu/jsmentch/READ_bids/data/${SUB}/${SES}/${SUB}_${SES}_${OUTFILE}.wav
