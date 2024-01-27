#!/bin/bash

set -x

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "Process ID: $$"
echo "Exit status of last command: $?"
echo "All arguments (separate strings): $@"
echo "All arguments (single string): $*"

for arg in "$@"
do
    echo "$arg"
done

for arg in "$*"
do
    echo "$arg"
done

