#!/usr/bin/bash
#
# Simple script to do nothing useful, but could easily be replaced with something useful
#

if [[ ! -d random_script_output ]]
then
    mkdir random_script_output
fi

printf "Installing packages...\n"

PACKAGES=`cat package-list`
for PACK in ${PACKAGES}
    do sudo yum install -y ${PACK}
done
