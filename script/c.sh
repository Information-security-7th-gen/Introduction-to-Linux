#!/bin/sh

script_dir="$HOME/Introduction-to-Linux/script"
dir_path="$script_dir/answer/"
files=`find ${dir_path}* -maxdepth 0 -type f -name "*.txt" | rev | cut -d / -f 1 | rev`

mkdir $script_dir/c_answer
for file in $files;
do
    cat ${dir_path}${file} | base64 > $script_dir/c_answer/$file
done
