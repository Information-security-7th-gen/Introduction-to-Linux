#!/bin/bash

# pip install ctfcli
# ctf init
# ./setup.sh

for i in `seq 1 14`; do
    file="unit${i}.yml"
    echo ${file}
    if [ "$1" = "sync" ]; then
        ctf challenge sync ${file}
            if [ $? -ne 0 ]; then
                exit 1
            fi
    else
        ctf challenge install ${file}
            if [ $? -ne 0 ]; then
                exit 1
            fi
    fi
done
