#!/bin/bash

for i in `cat /home/t1/folders.txt`
do 
   cd /home/t1/migrate/misc/$i
   echo "Processing in $i..........."
   ls -la .git
   cd /home/t1/migrate/misc/
   echo "=================================="
done
