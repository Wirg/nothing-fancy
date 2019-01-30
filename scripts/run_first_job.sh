#!/usr/bin/env bash
job_dir=jobs
extension=job
initial_path=`pwd`
# hello.job
first_job=`/bin/ls ${job_dir} | grep -P ".*.job" | sort -g | head -n 1`
# hello
job_name=${first_job%.*}
# jobs/hello.job
first_job=${job_dir}/${first_job}
command=`cat ${first_job}`
tmp_name=${first_job}~${WORKER_NAME}
# jobs/hello.job~worker_i
mv ${first_job} ${tmp_name}

echo Running ${job_name}

bash ${initial_path}/${tmp_name}
rm ${tmp_name}

# Dumping
echo ${job_name} >> jobs_done
