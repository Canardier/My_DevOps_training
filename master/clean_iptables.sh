# Clean iptables rules
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X

# Check it 
sudo iptables -nvL


# check port 
# sudo netstat -tulpn | grep ':$port'
# sudo kill -9 PID