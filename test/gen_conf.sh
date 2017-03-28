#!/bin/bash

source ./conf.sh

for template in $(ls *template); do
    out_file=${template%.*}
    # out_file=AdRank_test.conf
    eval "echo \"$(cat ${template})\"" > ${out_file}
done
