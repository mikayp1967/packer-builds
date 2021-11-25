#!/usr/bin/bash
#
# Install packages according to package-list
# I run this after other scripts to avoid yum lock
#

if [[ ! -d random_script_output ]]
then
    mkdir random_script_output
fi

printf "Installing packages...\n"

PACKAGES=`cat ~/package-list`
for PACK in ${PACKAGES}
    do sudo yum install -y ${PACK}
done
