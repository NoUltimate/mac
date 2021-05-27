message=`sqlite3 ~/Library/Messages/chat.db << EOF
begin;
select text from message where ROWID IN (select max(ROWID) from message);`

code=""
str="验证码"
if [[ $message =~ $str ]]
then
    for i in `seq ${#message}`
    do
     temp=${message:$i:1}
     if [ -n "$(echo $temp| sed -n "/^[0-9][0-9]*$/p")" ];then
        echo $temp
        code+=$temp
     elif [ ${#code} -gt 0 ];then
         break;
     fi
    done
    echo $code | tr -d '\n' | pbcopy
fi