for i in `seq 10`
do
    mkdir -p $HOME/challenge/unit$i
done

mkdir -p $HOME/challenge/unit3/jp/hoge/hogehoge
mkdir -p $HOME/challenge/unit3/jp/fuga/fugafuga
mkdir -p $HOME/challenge/unit3/jp/piyo/piyopiyo
mkdir -p $HOME/challenge/unit3/jp/hogera

mkdir -p $HOME/challenge/unit3/en/foo/bar
mkdir -p $HOME/challenge/unit3/en/foobar

touch $HOME/challenge/unit4/answer4.txt.tmp

cp ./colors.txt $HOME/challenge/unit7/

for i in `seq 4`
do
    for j in `seq 12`
    do
	case "$j" in
		"2" )
			for k in `seq 28`
			do
				mkdir -p $HOME/challenge/unit8/202$i/$j/$k
			done	
		;;
		"1" | "3" | "5" | "7" | "8" | "10" | "12" )
			for k in `seq 31`
			do
				mkdir -p $HOME/challenge/unit8/202$i/$j/$k
			done	

		;;
		* )
			for k in `seq 30`
			do
				mkdir -p $HOME/challenge/unit8/202$i/$j/$k
			done	

		;;
	esac
    done
    echo "finish 202$i"
done
mkdir -p $HOME/challenge/unit8/2024/2/29
cp ./answer/answer8.txt $HOME/challenge/unit8/2023/8/5/answer8.txt

cp ./fake_answer9.txt $HOME/challenge/unit9/answer9.txt

mkdir $HOME/challenge/unit10/tmp

for i in `seq 10`
do
	touch $HOME/challenge/unit10/tmp/yqewfh$i.tmp
done
