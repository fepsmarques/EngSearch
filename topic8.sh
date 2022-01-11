#!/bin/bash
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
	#Jogando as informações do servidor em variaveis
	time=`ssh myuser@${server} "date "+%T""`
	date=`ssh myuser@${server} "date +"%d/%m/%y""`
	hostname=`ssh myuser@${server} "hostname"`
	ip=`ssh myuser@${server} "hostname -i"`
	kernel=`ssh myuser@${server} "uname -r"`

	echo -e "$time \t $date \t $hostname \t $ip \t $kernel" >> $result
done