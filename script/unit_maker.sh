script_dir="$HOME/Introduction-to-Linux/script"
sudo mkdir -p /.cst/c_answer
$script_dir/c.sh
sudo cp $script_dir/c_answer/* /.cst/c_answer/
sudo cp $script_dir/override.sh /.cst/override.sh
source /.cst/override.sh

base="$HOME/.challenge/unit"

for i in `seq 14`
do
    mkdir -p ${base}${i}
done

mkdir -p ${base}3/jp/hoge/hogehoge
mkdir -p ${base}3/jp/fuga/fugafuga
mkdir -p ${base}3/jp/piyo/piyopiyo
mkdir -p ${base}3/jp/hogera

mkdir -p ${base}3/en/foo/bar
mkdir -p ${base}3/en/foobar

touch ${base}4/answer4.txt.tmp

cp $script_dir/colors.txt ${base}7/

for i in `seq 4`
do
    for j in `seq 12`
    do
	case "$j" in
		"2" )
			for k in `seq 28`
			do
				mkdir -p ${base}8/202$i/$j/$k
			done	
		;;
		"1" | "3" | "5" | "7" | "8" | "10" | "12" )
			for k in `seq 31`
			do
				mkdir -p ${base}8/202$i/$j/$k
			done	

		;;
		* )
			for k in `seq 30`
			do
				mkdir -p ${base}8/202$i/$j/$k
			done	

		;;
	esac
    done
    echo "finish 202$i"
done
mkdir -p ${base}8/2024/2/29
cp $script_dir/answer/answer8.txt ${base}8/2023/8/5/answer8.txt

cp $script_dir/fake_answer9.txt ${base}9/answer9.txt

mkdir -p ${base}10/tmp

for i in `seq 10`
do
	touch ${base}10/tmp/yqewfh$i.tmp
done

mkdir -p ${base}11/answer

cp $script_dir/answer/answer12.txt ${base}12/answer12.txt
sudo chmod 600 ${base}12/answer12.txt
sudo chown root ${base}12/answer12.txt

cp $script_dir/hint.txt ${base}13/hint.txt
touch ${base}13/answer13.txt

# rm -rf $HOME/Introduction-to-Linux
