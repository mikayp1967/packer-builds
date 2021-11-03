#!/usr/bin/bash
#
# Simple script to do nothing useful, but could easily be replaced with something useful
#

if [[ ! -d random_script_output ]]
then
    mkdir random_script_output
fi

DATE_STR=`date '+%d-%m-%y %T'`
printf "%s     %s \b" ${BASH_SOURCE} ${DATE_STR} >> random_script_output/scripts.log
sleep 15