cd () {
	pwd=`pwd`
	if [ $1 = "unit1/" -o $1 = "unit1" ]; then
		if [ $pwd == "$HOME/challenge" ]; then
			builtin cd unit1
			if [ ! -e "answer1.txt" ]; then
				cat $ANSWER/answer1.txt | base64 -d > answer1.txt
				echo -e '\n create answer1.txt\n'
			fi
		fi
	else
		builtin cd $1
	fi
}
