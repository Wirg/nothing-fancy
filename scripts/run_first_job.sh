#!/usr/bin/env bash
extension=job
initial_path=`pwd`
first_job=`/bin/ls jobs/*.${extension} | head -n 1`
command=`cat ${first_job}`
tmp_name=${first_job}~${WORKER_NAME}
mv ${first_job} ${tmp_name}
echo Running ${first_job}
bash ${initial_path}/${tmp_name}
rm ${tmp_name}
echo ${tmp_name} | grep -oP "\d+."${extension} >> jobs_done
