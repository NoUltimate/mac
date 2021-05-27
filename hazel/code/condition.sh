rowid=`sqlite3 ~/Library/Messages/chat.db << EOF
begin;
select max(ROWID) from message;`
if [ ! -d temp.txt ];then
    touch temp.txt
fi

old=$(cat temp.txt)
echo $rowid > temp.txt
if [[ $rowid -gt $old ]];then
    exit 0
else
    exit 1
fi