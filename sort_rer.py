# python script to copy rer files (except RAN, etc) into task->semester->item format
import os
import shutil
import pandas as pd

#load csv from Nuria
data=pd.read_csv('rer_audios_descr.csv')
#remove NaN subjects
data.dropna(subset=['Student Tracking Id'], inplace=True) 
# remve "(" and everything after it
data['Task Name'] = data['Task Name'].str.split('(').str[0]
# remve "-" and everything after it
data['Task Name'] = data['Task Name'].str.split('-').str[0]
# remve ":" and everything after it
data['Task Name'] = data['Task Name'].str.split(':').str[0]
# remove leading and trailing spaces
data['Task Name'] = data['Task Name'].str.strip()
# remove z typo
data['Task Name'] = data['Task Name'].str.replace('z', '').str.replace('Paired Assoc. Learning', 'Paired Associate Learning').str.replace('Associates', 'Associate')


tasks_to_exclude = ['Letter Naming Context', 'Letter Naming Isolation', 'Letter Sounds Context', 
                    'Letter Sounds Isolated', 'Rapid Letter Naming', 'Rapid Object Naming']
# Dataframe with rows where 'Task Name' is not in the list of tasks to exclude
df_standard = data[~data['Task Name'].isin(tasks_to_exclude)]
# Dataframe with rows where 'Task Name' is in the list of tasks to exclude
df_noitem = data[data['Task Name'].isin(tasks_to_exclude)]

#copy the files that DO not need to be placed in item specific folders (~400,000 files, could take like... 24 hours)

destination='/nese/mit/group/sig/projects/readnet/rer_sorted'
# Iterate over the DataFrame rows
for index, row in df_standard.iterrows():
    # Define the destination directory path
    dest_dir = os.path.join(destination, row['Task Name'], row['semester'], row['Item Name'])
        
    src_file = os.path.join('/nese/mit/group/sig/projects/readnet/rer_missing/', str(row['1']), str(row['2']))

    # Create the destination directory if it doesn't exist
    os.makedirs(dest_dir, exist_ok=True)
    
    # Copy the file
    shutil.copy(src_file, dest_dir)