import os

def run_command(host, password, command):
    command = f"sshpass -p {password} pssh -h {host} -l root -A -i {command}"
    os.system(command)

if __name__ == "__main__":
    password = input("Enter the password: ")

    with open("./hosts") as f:
        hosts = f.read().splitlines()

    while True:
        command = input("Enter the command to run: ")
        for host in hosts:
            run_command(host, password, command)
