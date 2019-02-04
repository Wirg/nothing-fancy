#!/usr/bin/env bash
export BASE_DIRECTORY=$(realpath $(dirname "$0")/..)
export job_dir=${BASE_DIRECTORY}/jobs
export working_dir=${BASE_DIRECTORY}/working_directory/totem
export WORKER_NAME=default

queue_jobs () {
    echo $(/bin/ls "${job_dir}" | grep -P ".*.job$") || return 1
}
