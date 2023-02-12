import subprocess
import os

def send_command(host_file, command):
    subprocess.run(["pdsh", "-R", "ssh", "-w", "@" + host_file, command])

def send_file(host_file, local_file, remote_file):
    subprocess.run(["pdcp", "-R", "ssh", "-w", "@" + host_file, local_file, remote_file])

def run_remote_commands():
    host_file = input("Enter the path to the host file: ")
    while True:
        command = input("Enter the command you want to run: ")
        if command.strip() == "exit":
            break
        send_command(host_file, command)

if __name__ == "__main__":
    run_remote_commands()
