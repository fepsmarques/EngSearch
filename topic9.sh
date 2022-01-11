#!/bin/bash

################Quick Usage Guide################
#Create a file control_file.txt in the same location of the script with the lines which needs to be verified, run the script

serverlist='control_file.txt'

#we write in variable all the content just to display on echo
servers=`cat $serverlist`

#Show file before reomving upgrade
echo -e "Before removing duplicates"
echo -e "cat $servers"

#Send to awk that the separator is triple space, request to remove duplicates from serverlist and send the output fo output_1.txt 
awk -F'   ' '!seen[$1]++' $serverlist > /tmp/output_1.txt

#Show the output after removing files
echo -e "After removing duplicates"
cat /tmp/output_1.txt
