#!/bin/bash
# TrustSphere 
# author - Tom Butler 210/02/2020  Version 0.1
STAGE=/mnt/stage/o365-output/

echo "Building a list of llc files", $STAGE
input="lof.txt"
echo $input

while IFS= read -r line
do
cut -c65-130 $STAGE$line|sort|uniq >>build2.txt
	echo $line 
	done < $input
