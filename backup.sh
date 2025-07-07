#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory 
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid "
  exit
fi


targetDirectory=$1
destinationDirectory=$2

echo "The targetdirectory is $1"
echo "The destinationdirectory is $2"


currentTS=$(date +%s)
backupFileName="backup$currentTS.tar.gz"


# store it path as variable
origAbsPath=$(pwd)

# goes to destinationdirectory to store it path as variable
cd $destinationDirectory # <-
destDirAbsPath=$(pwd)

#moves to origpath-->targetdirectory
cd "$origAbsPath" # <-
cd "$targetDirectory" # <-

#Gets yesterdays timestamp
yesterdayTS=$((currentTS-24*60*60))
#Creates empty array
declare -a toBackup

for file in  .* * 
do
  
  if [[ $(date -r "$file" +%s) -gt $yesterdayTS ]]
  then
    toBackup+=("$file")
  fi
done


tar -czvf "$backupFileName" "${toBackup[@]}"
#it moves the archived folder to destination
mv $backupFileName $destDirAbsPath

