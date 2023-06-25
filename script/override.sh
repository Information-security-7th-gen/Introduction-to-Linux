cd_override () {
	pwd=`\pwd`
	if [ $# = 0 ]; then
		\cd
	else
		\cd $@
		if [ $1 = "unit1/" -o $1 = "unit1" ]; then
			if [ $pwd = "$HOME/challenge" ]; then
				if [ ! -e "answer1.txt" ]; then
					cat $ANSWER/answer1.txt | base64 -d > answer1.txt
					echo -e '\n answer1.txtが作成されました\n'
				else
					if [ "`cat $ANSWER/answer1.txt`" != "`cat answer1.txt`" ]; then
						cat $ANSWER/answer1.txt | base64 -d > answer1.txt
						echo -e '\n answer1.txtが作成されました\n'
					fi
				fi
			fi
		elif [ $1 = "unit7/" -o $1 = "unit7" ]; then
			if [ $pwd = "$HOME/challenge" ]; then
				if [ ! -e "$HOME/challenge/unit3/jp/hoge/hogehoge/answer7.txt" ]; then
					cat $ANSWER/answer7.txt | base64 -d > $HOME/challenge/unit3/jp/hoge/hogehoge/answer7.txt
				else
					if [ "`cat $ANSWER/answer7.txt`" != "`cat $HOME/challenge/unit3/jp/hoge/hogehoge/answer7.txt`" ]; then
						cat $ANSWER/answer7.txt | base64 -d > $HOME/challenge/unit3/jp/hoge/hogehoge/answer7.txt
					fi
				fi
			fi
		fi
	fi
}

check_answer() {
	for i in 1 2 3 4
	do
		if [ ! -e "$HOME/challenge/unit5/answer/answer$i.txt" ]; then
			return 1
		fi
		if [ "`cat $ANSWER/answer$i.txt | base64 -d`" != "`cat $HOME/challenge/unit5/answer/answer$i.txt`" ]; then
			return 1
		fi
		if [ $i != 3 ];then
			if [ ! -e "$HOME/challenge/unit$i/answer$i.txt" ]; then
				return 1
			fi
			if [ "`cat $ANSWER/answer$i.txt | base64 -d`" != "`cat $HOME/challenge/unit$i/answer$i.txt`" ]; then
				return 1
			fi
		else
			if [ ! -e "$HOME/challenge/unit3/en/foo/bar/answer3.txt" ]; then
				return 1
			fi
			if [ "`cat $ANSWER/answer3.txt | base64 -d`" != "`cat $HOME/challenge/unit3/en/foo/bar/answer3.txt`" ]; then
				return 1
			fi
		fi
	done
	return 0
}


touch_override () {
	\touch $@
	pwd=`\pwd`
	\touch $@
	if [ "`echo $@ | grep 'answer2.txt'`" ]; then
		if [ $pwd = "$HOME/challenge/unit2" ]; then
			if [ "`cat $ANSWER/answer2.txt | base64 -d`" != "`cat answer2.txt`" ]; then
				cat $ANSWER/answer2.txt | base64 -d > answer2.txt
				echo -e '\n answer2.txtに何か書かれたような...\n'
			fi
		fi
	elif [ "`echo $@ | grep 'answer5.txt'`" ]; then
		if [ $pwd = "$HOME/challenge/unit5" ]; then
			check_answer
			r=$?
			if [ "`cat $ANSWER/answer5.txt | base64 -d`" != "`cat answer5.txt`" -a $r = 0 ]; then
				cat $ANSWER/answer5.txt | base64 -d > answer5.txt
				echo -e '\n answer5.txtに何か書かれたような...\n'
			fi
		fi
	fi
}

pwd_override () {
	pwd=`\pwd $@`
	echo $pwd  
	if [ $pwd = "$HOME/challenge/unit3/en/foo/bar" ]; then
		if [ -e answer3.txt ]; then
			if [ "`cat $ANSWER/answer3.txt | base64 -d`" != "`cat answer3.txt`" ]; then
				cat $ANSWER/answer3.txt | base64 -d > answer3.txt
				echo -e '\n answer3.txtが作成されました\n'
			fi
		else
			cat $ANSWER/answer3.txt | base64 -d > answer3.txt
			echo -e '\n answer3.txtが作成されました\n'
		fi
	fi
}

mv_override () {
	pwd=`\pwd`
	\mv $@
	if [ $pwd = "$HOME/challenge/unit4" ]; then
		if [ ! -e "answer4.txt.tmp" -a -e "answer4.txt" -a "`cat $ANSWER/answer4.txt`" != "`cat answer4.txt`" ]; then
			cat $ANSWER/answer4.txt | base64 -d > answer4.txt
			echo -e '\n answer4.txtに何か書かれたような...\n'
		fi
	fi
}

vim_override () {
	pwd=`\pwd`
	\vim $@
	if [ $pwd = "$HOME/challenge/unit6" ];then
		if [ "`echo $@ | grep 'date.txt'`" ]; then
			if [ -e "date.txt" ]; then
				if [ "`cat date.txt`" = "2023/08/05" ];then
					if [ ! -e "answer6.txt" ]; then
						cat $ANSWER/answer6.txt | base64 -d > answer6.txt
						echo -e "\n answer6.txtが作成されました\n"
					else 
						if [ "`cat $ANSWER/answer6.txt | base64 -d`" != "`cat answer6.txt`" ]; then
							cat $ANSWER/answer6.txt | base64 -d > answer6.txt
							echo -e "\n answer6.txtが作成されました\n"
						fi

					fi
				fi
			fi
		fi
	fi
}

rm_override () {
	pwd=`\pwd`
	\rm $@
	if [ $pwd = "$HOME/challenge/unit9" ];then
		if [ "echo $@ | grep 'answer9.txt'" ]; then
			cat $ANSWER/answer9.txt | base64 -d > answer9.txt
			echo -e "\n 本当のanswer9.txtを作成しました\n"
		fi
	fi
}

alias touch="touch_override"
alias cd="cd_override"
alias pwd="pwd_override"
alias mv="mv_override"
alias vim="vim_override"
alias rm="rm_override"
