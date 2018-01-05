remote_server=$1
remote_pwd=$2
maildir_path=$3
folder_name=$4
template='maildir_format_template'

echo "Remote Server: $remote_server"
echo "Remote Maildir Path: $maildir_path"
echo "Folder name: $folder_name"
echo "Copying..."
sshpass -p "$remote_pwd" scp -r $template "$remote_server:$maildir_path/.$folder_name"
return_status=$?
if [ $return_status -eq 0 ] 
then 
	echo "$folder_name" | sshpass -p $remote_pwd ssh -t -T $remote_server "cat >> ~/Maildir/subscriptions"
	echo "Done Successfully." 
else 
	echo "Failed. Please check path/password." 
fi
