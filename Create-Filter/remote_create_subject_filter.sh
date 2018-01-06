remote_server=$1
remote_pwd=$2
sieve_path=$3
filter=$4
move_to=$5

echo "Remote Server: $remote_server"
echo "Remote Seive Path: $seive_path"
echo "Filter: $Filter"
echo "Creating \"Subject-is-equal-to\"  Filter..."


echo "# rule:[$filter]"                            | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> $sieve_path/managesieve.sieve"
echo "if header :is \"subject\" \"$filter\"" | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> $sieve_path/managesieve.sieve"
echo "{"                                           | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> $sieve_path/managesieve.sieve"
echo "        fileinto \"$move_to\";"              | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> $sieve_path/managesieve.sieve"
echo "}"                                           | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> $sieve_path/managesieve.sieve"

echo "Done."

