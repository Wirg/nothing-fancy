#!/usr/bin/env bash
source base_config.sh
# hello.job
first_job=$(queue_jobs | sort -g | head -n 1)
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
