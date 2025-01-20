#!/bin/bash

# Check Input Arguments for the Script
if [ $# -ne 2 ]
then
    echo "ERROR: Required 2 Arguments (Full File Path and Text String) not present"
    exit 1
fi

writefile=$1
writestr=$2

# Create the File and Directories (including Parent Directories) based on given path
mkdir -p "$(dirname "$writefile")"

# Write (and overwrites the file content) the string to the file
echo "$writestr" > "$writefile"

# Check for any errors after writing based on the Exit Status
if [ $? -ne 0 ]
then
    echo "ERROR: Could not create or write to the file '$writefile'."
    exit 1
fi
