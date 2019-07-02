# Data-Science
Background
A TrustVault connector has been deployed on your premises and has been creating processed LLC files from the meta-data collection provided by your Office365 subscription or Exchange instance. At the end of the term (usually 90 days) you will have significant volume of processed data.
You have an internal requirement that ensures all internal staff in your organization is not recognizable when viewed on a user interface or report.

Description
The de-id.sh script will search through all the files in the staging location and create a sorted and unique list of all internal staff. Next an obscurity table will be constructed using the Caesar Cipher

Original Name	Ciphered Name
abubakar.abbas	xyryxhxo.xyyxp
abubakar.latif		xyryxhxo.ixqfc
abubakar.ogashuwa	xyryxhxo.ldxpertx
abubakari.sadique	xyryxhxof.pxafnrb
………………….	…………………..

The script continues and carries out a ‘search and replace’ on all llc files recursively where the original name will be replaced with a ciphered version.

Usage
The Scheduled task that operates the connector script must be stopped as the assigned term for collection is now complete.

The llc files have been created in a ‘stage’ directory on your Linux server.
Backup the stage directory

# cp -R stage stagebkp

cd to the stage dir and get the path
# pwd
Example from ‘pwd’
/usr/src/anon/stage
Only llc files must exist in the stage directory. Remove everything else

Install the script
cd /usr/src
mkdir anon

sftp the de-id.tar.gz to the anon directory

Untar the script 
tar zxvf de-id.tar.gz
chmod a+x de-id.sh
chmod -R 777 stage


Edit the script
#vi de-id.sh
Edit lines 5 and 6 to suite your environment
DOMAIN=<your domain> preceded with ‘@’
STAGE=<from pwd> ended with ‘/’

 

Save and exit vi

Usage
On your terminal in the anon directory
#./de-id.sh

Throughout the process, messages will be written to the screen.

[root@v3test anon]# ./de-id.sh
Building a list of llc files
reading enron-1234.llc file and preparing names
reading enron-5678.llc file and preparing names
reading enron-9012.llc file and preparing names
sorting 16382 names
creating anonymization table
Processing 1 of 3 llc files
Processing 2 of 3 llc files
Processing 3 of 3 llc files
Time taken  -46 minutes
The anonymization keyfile.txt has been created in this directory



Key file 
Retrieving the keyfile from the server will show the cipher table
It can be imported into an Excel spread sheet.

barbara.gray	yxoyxox.doxv
barbara.halle	yxoyxox.exiib
barbara.heuter	yxoyxox.ebrqbo
barbara.hooks	yxoyxox.ellhp
barbara.hueter	yxoyxox.erbqbo
barbara.lewis	yxoyxox.ibtfp
barbara.paige	yxoyxox.mxfdb

Additional messaging
Additional messaging from the script can be obtained by removing the comment ‘#’ from line 47

 
To
 

This will result is a scrolling message on the screen 
changing willis.philip@enron.com to tfiifp.mefifm@enron.com  on  enron-SERV1_164636084559357833290.llc
changing wilma.mendiola@enron.com to tfijx.jbkaflix@enron.com on  enron-SERV1_164636084559357833290.llc

Avoid corrupted files.
Never work on a stage directory without a backup
Never run de-id.sh more than once on a stage directory.

