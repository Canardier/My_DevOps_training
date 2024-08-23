echo "y\n" | HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P ""

for server in `cat server.txt`;  
do  
    sshpass -p "vagrant" ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@$server  
done