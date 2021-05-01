#!/bin/bash
while true
do
	date
	echo "--------------------------------"
	echo "	  Main Menu"
	echo "--------------------------------"
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Process operations"
	echo "10. Exit"
	printf "Enter your choice [ 1 - 10 ] "
	read -r opt
	if [ $opt == "1" ]
	then
		echo "--------------------------------"
		echo "	System information"
		echo "--------------------------------"
		echo "Operating system: Linux"
		lsb_release -a
	elif [ $opt == "2" ]
	then
		echo "--------------------------------"
		echo "	Hostname and DNS information"
		echo "--------------------------------"
		printf "Hostname : "
		hostname
		printf "DNS domain : "
		dnsdomainname
		printf "\nFully qualified domain name : "
		hostname --fqdn
		printf "\nNetwork address (IP) : "
		hostname -I
		printf "\nDNS name servers (DNS IP) : "
	elif [ $opt == "3" ]
	then
		echo "--------------------------------"
		echo "	Network information"
		echo "--------------------------------"
		ip link show
		route
		netstat -rn
	elif [ $opt == "4" ]
	then
		echo "--------------------------------"
		echo "	Who is online"
		echo "--------------------------------"
		who
	elif [ $opt == "5" ]
	then
		echo "--------------------------------"
		echo "List of last logged in users"
		echo "--------------------------------"
		last
	elif [ $opt == "6" ]
	then
		echo "--------------------------------"
		echo "	Public IP information"
		echo "--------------------------------"
		dig +short myip.opendns.com @resolver1.opendns.com
	elif [ $opt == "7" ]
	then
		echo "--------------------------------"
		echo "	Disk Usage Info"
		echo "--------------------------------"
		df -h --output=pcent --output=target
	elif [ $opt == "8" ]
	then
		echo "--------------------------------"
		echo "	My Home file-tree"
		echo "--------------------------------"
		./proj1.sh
	elif [ $opt == "9" ]
	then
	while true
	do
		printf "(please enter the number of your selection below)\n\n"
		echo "1. show all processes"
		echo "2. kill a prcess"
		echo "3. bring up top"
		echo "4. return to main menu"
		printf "Enter your choice [ 1 - 4 ] "
		read -r opt_9
		if [ $opt_9 == "1" ]
		then
			ps -aux | less
		elif [ $opt_9 == "2" ]
		then	
			printf "Please enter the PID of the process you would like to kill: "
			read -r kill_id
			kill -9 $kill_id
		elif [ $opt_9 == "3" ]
		then
			top
		elif [ $opt_9 == "4" ]
		then
			break
		fi
	done
	elif [ $opt == "10" ]
	then
		break
	fi
	read -n 1 -r -s -p $'Press [Enter] key to continue...'
done

