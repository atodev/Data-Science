#!/bin/bash
# TrustSphere 
# author - Tom Butler 18/03/2020  Version 0.1

for file in *.llc
do
echo "From	To	Direction	DateTime" > ../$file
cat $file|egrep -f names.txt >> ../$file
done 