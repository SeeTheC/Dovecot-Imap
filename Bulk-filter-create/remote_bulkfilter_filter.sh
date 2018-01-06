remote_server=$1
remote_pwd=$2
prefix=$3
count=$4
maildir_path="~/Maildir"
sieve_path="~/sieve"

folder_creator_dir="cd ../Automatic-Maildir-Folder-Generation/"
filter_creator_dir="cd ../Create-Filter/"
my_dir="cd ../Bulk-filter-create/"

folder_creator=" ./remote_newfolder_from_shell.sh $remote_server $remote_pwd $maildir_path"
filter_creator=" ./remote_create_subject_filter.sh $remote_server $remote_pwd $sieve_path"

echo "**Remote Server: $remote_server"
echo "**Remote Seive Path: $seive_path"
echo "**Prefix: $prefix"
echo "**Count of filter: $count"

echo "Creating \"Subject Contain\" Filters ..."

echo "**Creating Base Folder"
# Creating Base Folder
$folder_creator_dir
$folder_creator $prefix
$my_dir	
echo "----------------------------------"
for i in `seq 1 $count`;
do
        echo "**Creating SUB Folder & Filter: $i"
        echo " "
	# Creating SUB Folder
	$folder_creator_dir
	$folder_creator "$prefix.$prefix$i"
	$my_dir
	echo "  "
	# Creating Filter
	$filter_creator_dir
	$filter_creator "$prefix$i" "$prefix.$prefix$i"
	$my_dir
        echo "---------------------------"
done 

echo "Done."

