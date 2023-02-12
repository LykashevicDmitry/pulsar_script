#!/bin/bash

echo "Enter the path to the file containing the list of servers: "
read servers_file

while true; do
    echo "Enter the command you want to run on the remote servers (type 'exit' to quit):"
    read command

    if [ "$command" = "exit" ]; then
        break
    fi

    pdsh -R ssh -w ^$servers_file $command
done
