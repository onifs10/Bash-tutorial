#!/bin/sh

# This script read from a file and print the content of the file

echo "Enter the file name"
read FILE

while read -r LINE
do
    echo "$LINE"
done < "$FILE"
