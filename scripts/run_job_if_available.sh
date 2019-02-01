#!/usr/bin/env bash
job_dir=${BASE_DIRECTORY}/jobs
number_of_jobs=`/bin/ls ${job_dir} | grep -P ".*.job" | wc -l`
number_of_gpu_jobs=`nvidia-smi | grep "python" | grep -P "\d{4,}MiB" | wc -l`

if [ $number_of_jobs -gt 0 ] && [ $number_of_gpu_jobs -gt 0 ]
then
    bash ${BASE_DIRECTORY}/scripts/run_first_job.sh
fi
