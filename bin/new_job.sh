#!/usr/bin/env bash
source base_config.sh
commit=$(git rev-parse HEAD)
time=$(date +%Y%m%d_%H%M%S)

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize variables:
file_header=''
job_name_suffix=''

while getopts ":pn:" opt; do
    case "$opt" in
    p)
        file_header=_${file_header}
        ;;
    n)
        job_name_suffix=_$OPTARG
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac
done

shift $((OPTIND-1))

[[ "${1:-}" = "--" ]] && shift

echo git fetch origin "&&" git checkout "${commit}" "&&" "$@" > "${job_dir}"/${file_header}"${time}""${job_name_suffix}"_"$(whoami)".job
