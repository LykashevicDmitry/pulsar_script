import subprocess

def send_commands(hosts_file, username, password, command):
    with open(hosts_file, 'r') as f:
        hosts = f.readlines()

    hosts = [h.strip() for h in hosts]

    for host in hosts:
        cmd = "sshpass -p {} pssh -t 0 -h {} -l {} {}".format(password, host, username, command)
        subprocess.run(cmd, shell=True)

def send_files(hosts_file, username, password, local_file, remote_file):
    with open(hosts_file, 'r') as f:
        hosts = f.readlines()

    hosts = [h.strip() for h in hosts]

    for host in hosts:
        cmd = "sshpass -p {} scp {} {}@{}:{}".format(password, local_file, username, host, remote_file)
        subprocess.run(cmd, shell=True)

if __name__ == '__main__':
    while True:
        choice = input("Enter 'c' to send commands, 'f' to send files, 'q' to quit: ")
        if choice == 'c':
            hosts_file = input("Enter the path to the hosts file: ")
            username = input("Enter the username: ")
            password = input("Enter the password: ")
            command = input("Enter the command: ")
            send_commands(hosts_file, username, password, command)
        elif choice == 'f':
            hosts_file = input("Enter the path to the hosts file: ")
            username = input("Enter the username: ")
            password = input("Enter the password: ")
            local_file = input("Enter the path to the local file: ")
            remote_file = input("Enter the path to the remote file: ")
            send_files(hosts_file, username, password, local_file, remote_file)
        elif choice == 'q':
            break
        else:
            print("Invalid option, try again.")
