# echo "y\n" | HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P ""

for server in `cat server.txt`;  
do  
    ssh-copy-id vagrant@$server  
done