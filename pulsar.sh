#!/bin/bash

echo "Enter the command you want to run on the remote servers:"
read command
echo "Enter the path to the file containing the list of servers: "
read servers_file

pdsh -R ssh -w ^$servers_file $command
