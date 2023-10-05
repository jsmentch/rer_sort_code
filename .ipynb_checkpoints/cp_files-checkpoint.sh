#!/bin/bash
#script to take in a list of the unified files eg SRT_unified.csv and move them somewhere in bids-like format

#datalad_dataset='/om2/scratch/tmp/jsmentch/rer_kaggle/data'
datalad_dataset='/om/tmp/jsmentch/rer_kaggle/data'

input_directory='/om/tmp/jsmentch/rer/Scores'

csv_in=$1
# open the CSV file
#head -n 10 SRT_unified.csv | while IFS=',' read -r grade audio_string student_id true_season folder task junk; do
while IFS=',' read -r grade audio_string student_id true_season folder task junk; do
    # do something with the variables
    #echo "Grade: $grade"
    #echo "Audio String: $audio_string"
    #echo "Student ID: $student_id"
    #echo "True Season: $true_season"
    #echo "Folder: $folder"
    #echo "Task: $task"

    #echo "junk: $junk"
    sub_ses_task=${datalad_dataset}/sub-${student_id}/ses-${grade}_${true_season}/task-$task
    #echo $sub_ses_task
    file_in=$input_directory/$folder/$audio_string
    file_out=$sub_ses_task/$audio_string
    #echo $file_in
    #echo $file_out
    mkdir -p $sub_ses_task
    cp $file_in $file_out
#done
done < $csv_in