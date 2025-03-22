#!/bin/bash
# script for finding string from a directory
# Author: Tom Jordan Santiago

set -e
set -u

if [[ $# < 2 ]]; then
    echo "error : expected 2 arguments but passed $#"
    exit 1
fi

filesdir=$1
searchstr=$2

if [[ ! -d $filesdir ]]; then
    echo "error : '$1' is not a directory"
    exit 1
fi

files_count=$(
    pushd $filesdir &>/dev/null
    find -L . -type f | wc -l
    popd &>/dev/null
)
matches_count=$(grep -ro $searchstr $filesdir | wc -l)
unique_lines_match_count=$(grep -Hnr $searchstr $filesdir | cut -d':' -f1 | uniq | wc -l)

# echo "files_count: $files_count"
# echo "matches_count: $matches_count"
# echo "unique_lines_match_count: $unique_lines_match_count"

echo "The number of files are $files_count and the number of matching lines are $unique_lines_match_count"

exit 0
