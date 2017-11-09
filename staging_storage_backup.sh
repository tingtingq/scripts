#!/bin/bash
####################################
#
# Backup Azure Blob Storages using azcopy.
#
####################################

# What to backup. 
#Staging
#source_storage_account="storagearchivestaging"
#source_key = ""

#Mytest
source_storage_account="testsource1"
source_key="siUcLMzvfAEiXOyLkU45wbfHa5DdWO+c1If5Za0fVaZrb/acKX0MpAseXSL71eg7yvdQUd8JBtJWt9K5TI9GGQ=="

# Where to backup to.
dest_storage_account="testbkup"
dest_key="fRwUSMADL+e6eydivCJv9oFNxthKfniuwOH6UaERhE3fjDiUmVTi2iJGz8tK+uxD4p7MMTEVmMrDkcriC3BX1g=="

# Resume journal file path.
mkdir -p ./journal


# Print start status message.
echo "Backing up starting..."
date
echo


for i in `cat ./blobcontainers.txt`;
do
     echo "copying container $i in Storage $source_storage_account to $dest_storage_account"
	 azcopy \
	    --source https://$source_storage_account.blob.core.windows.net/$i \
		--destination https://$dest_storage_account.blob.core.windows.net/$i \
		--source-key $source_key \
		--dest-key $dest_key \
		--recursive \
		--exclude-older \
		--resume ./journal \
		--quiet
	sleep 60
done

# Print end status message.
echo
echo "Backup finished..."
date
