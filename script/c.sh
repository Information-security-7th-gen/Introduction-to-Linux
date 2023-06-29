#!/bin/sh

dir_path="$HOME/script/answer/*"
dirs=`find $dir_path -maxdepth 0 -type f -name "*.txt"`

for dir in $dirs;
do
    d=`echo $dir | cut -d / -f 5-`
    cat $dir | base64 > $HOME/script/c_$d
done
