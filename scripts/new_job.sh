#!/usr/bin/env bash
commit=`git rev-parse HEAD`
time=`date +%Y%m%d_%H%M%S`

#!/bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize variables:
file_header=''
job_name_suffix=''

while getopts "p?n:" opt; do
    case "$opt" in
    p)
        file_header=_${file_header}
        ;;
    n)
        job_name_suffix=_$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[[ "${1:-}" = "--" ]] && shift

args=$@

echo git checkout ${commit} "&&" "$@" > jobs/${file_header}${time}${job_name_suffix}_$(whoami).job
