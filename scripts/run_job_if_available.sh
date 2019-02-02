#!/usr/bin/env bash
BASE_DIRECTORY=$(dirname "$0")/..
job_dir=${BASE_DIRECTORY}/jobs
number_of_jobs=$(/bin/ls "${job_dir}" | grep -cP ".*.job")
number_of_gpu_jobs=$(nvidia-smi | grep "python" | grep -cP "\d{4,}MiB")

if [ "$number_of_jobs" -gt 0 ]
then
if [ "$number_of_gpu_jobs" -eq 0 ]
then
    bash "${BASE_DIRECTORY}"/scripts/run_first_job.sh
else
    echo "GPU is not available"
fi
else
    echo "No job left"
fi
