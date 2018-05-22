remote_src_user=user1_212
remote_src_host=10.100.115.212
remote_src_dir=Maildir/ 
dst=sys_folder/
sudo rsync -azP $remote_src_user@$remote_src_host:$remote_src_dir $dst

