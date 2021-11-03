#!/usr/bin/bash

SCRIPT_LIST=`ls scripts/*sh`
chmod 755 scripts/*sh

for SCRIPT in $SCRIPT_LIST
    do printf "Running... $SCRIPT\n"
    bash -c $SCRIPT  
done