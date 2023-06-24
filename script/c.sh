#!/bin/sh

dir_path="answer/*"
dirs=`find $dir_path -maxdepth 0 -type f -name "*.txt"`

for dir in $dirs;
do
    cat $dir | base64  > c_$dir 
done
