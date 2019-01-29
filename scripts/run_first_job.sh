#!/usr/bin/env bash
job_dir=jobs
extension=job
initial_path=`pwd`
first_job=${job_dir}/`/bin/ls ${job_dir} | grep -P ".*.job" | sort -g | head -n 1`
command=`cat ${first_job}`
tmp_name=${first_job}~${WORKER_NAME}
mv ${first_job} ${tmp_name}
echo Running ${first_job}
bash ${initial_path}/${tmp_name}
rm ${tmp_name}
echo ${tmp_name} | xargs basename | grep -oP "\w+."${extension} >> jobs_done
