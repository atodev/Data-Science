#!/bin/bash
# TrustSphere Add suffix to hash for Cornell
# author - Tom Butler 14/02/2020  Version 0.1
STAGE="/mnt/stage/Cornell/o365-output"
cd $STAGE
	ls *.tsv > lof.txt
	input="lof.txt"
while IFS= read -r line
	do
	echo $line   #just checking
##--------------------
		cat $line |awk '{$1=$1"@med.cornell.test	";$2=$2"@med.cornell.test	";$3=$3"	";$4=$4"	"; print }' >../box/$line
#----------------------------
	done < "$input"
# the result also suffixed the header - this was corrected with (Win) S&R from funduc
# do this oneliner in the box dir after checking
for f in *.tsv; do mv -- "$f" "${f%.tsv}.llc"; done
