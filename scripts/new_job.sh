#!/usr/bin/env bash
commit=`git rev-parse HEAD`
echo git checkout ${commit} "&&" "$@" > jobs/_new_job_${commit}.job