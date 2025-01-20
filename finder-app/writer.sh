#!/bin/bash


#  Copyright (C) 2025 by Abhirath Koushik

#  Redistribution, modification or use of this software in source or binary
#  forms is permitted as long as the files maintain this copyright. Users are
#  permitted to modify this and use it to learn about the field of embedded
#  software. Abhirath Koushik and the University of Colorado are not liable for
#  any misuse of this material.

#  @file    writer.sh
#  @brief   This script writes a string into a given file which is either created or overwritten.

#  @author  Abhirath Koushik
#  @date    01-20-2025


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
