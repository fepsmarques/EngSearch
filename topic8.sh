#!/bin/bash
###########################quick usage guide###########################
#create a file called myservers_list.txt in the same directory, add the server list and save it. 

#Variable to get reference file
serverlist='myservers_list.txt'

#Moving the list of servers to a variable
servers=`cat $serverlist`

#Variable to send the results 
result='servers_version.txt'

#Headet
echo -e "Horario \t Data \t Hostname \t IP \t Server Version" > $result

#Loop to get information for each server 
for server in $servers
do
	#Setting variables to get info
	time=`ssh myuser@${server} "date "+%T""`
	date=`ssh myuser@${server} "date +"%d/%m/%y""`
	hostname=`ssh myuser@${server} "hostname"`
	ip=`ssh myuser@${server} "hostname -i"`
	kernel=`ssh myuser@${server} "uname -r"`
	
	#Sending info to result file
	echo -e "$time \t $date \t $hostname \t $ip \t $kernel" >> $result
done
