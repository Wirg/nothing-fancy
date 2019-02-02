#!/usr/bin/env bash
BASE_DIRECTORY=$(dirname "$0")/..
job_dir=${BASE_DIRECTORY}/jobs
working_dir=${BASE_DIRECTORY}/working_directory/totem
initial_path=$(pwd)
# hello.job
first_job=$(/bin/ls "${job_dir}" | grep -P ".*.job$" | sort -g | head -n 1)
# hello
job_name=${first_job%.*}
# jobs/hello.job
first_job=${job_dir}/${first_job}
tmp_name=${first_job}~${WORKER_NAME}
# jobs/hello.job~worker_i
mv "${first_job}" "${tmp_name}"

echo Running "${job_name}" at "${tmp_name}"

cd "${working_dir}"
bash "${tmp_name}"

rm "${tmp_name}"

# Dumping
echo "${job_name}" >> jobs_done
