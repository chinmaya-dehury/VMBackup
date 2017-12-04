
if [ $# == 0 ]
then 
	
	echo "Error: 	Too few arguments"
	echo "Please enter the name of VM to be cloned."
	echo "Syntax: autoBackup <name_of_VM>"
	exit;
fi


echo "Going to backup \"$1\" virtual machine."
backupVM=$1_backup_$(date +%m%d%y%H%M)
echo "The back up VM will be '$backupVM'"

vboxmanage controlvm $1 savestate
echo "$1 Machine has been saved."
vboxmanage clonevm $1 --options keepallmacs --name $backupVM
vboxmanage startvm $1 --type gui



echo "All done !!!"
