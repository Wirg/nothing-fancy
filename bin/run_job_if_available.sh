#!/usr/bin/env bash
source $(dirname "$0")/base_config.sh

number_of_jobs=$(/bin/ls "${job_dir}" | grep -cP ".*.job$")
number_of_gpu_jobs=$(nvidia-smi | grep "python" | grep -cP "\d{4,}MiB")

echo ${number_of_jobs}

if [ "$number_of_jobs" -gt 0 ]
then
if [ "$number_of_gpu_jobs" -eq 0 ]
then
    bash "${BASE_DIRECTORY}"/bin/run_first_job.sh
else
    echo "GPU is not available"
fi
else
    echo "No job left"
fi
