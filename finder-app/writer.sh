#!/bin/bash
# script for writing a string to a file
# Author: Tom Jordan Santiago

set -e
set -u

if [[ $# < 2 ]]; then
    echo "error : expected 2 arguments but passed $#"
    exit 1
fi

writefile=$1
writestr=$2

# check if the directory exists, if not, create the directory
if [[ ! -d $(readlink -e "${writefile%/*}") ]]; then
    mkdir -p ${writefile%/*}
fi

# create/overwrite the $writefile with $writestr
echo $writestr >$writefile

exit 0
