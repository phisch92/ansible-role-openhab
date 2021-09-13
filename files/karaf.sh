#!/usr/bin/env bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -u username -p password -c command"
   echo -e "\t-u karaf username"
   echo -e "\t-p karaf password"
   echo -e "\t-c karaf command"
   exit 1 # Exit script after printing help
}

while getopts "u:p:c:" opt
do
   case "$opt" in
      u ) username="$OPTARG" ;;
      p ) password="$OPTARG" ;;
      c ) command="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$username" ] || [ -z "$password" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

output=$(sshpass -p $password ssh -q -p 8101 $username@localhost "openhab:users $command")

echo $output
