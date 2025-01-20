#!/bin/bash

# Check Input Arguments for the Script
if [ $# -ne 2 ]
then
    echo "ERROR: Required 2 Arguments (Directory Path and Search String) not present"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the Directory Exists
if [ ! -d "$filesdir" ]
then
    echo "ERROR: Given Directory '$filesdir' does not exist"
    exit 1
fi

# Count the number of lines in the Directory
num_files=$(find "$filesdir" -type f | wc -l)

# Count the Matching Lines where the Search String was found
num_match_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the Results
echo "The number of files are $num_files and the number of matching lines are $num_match_lines"
