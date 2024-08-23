cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

containerd config default > config.toml
sudo mkdir /etc/containerd
sudo mv config.toml /etc/containerd/
sudo sed -i '/SystemdCgroup = false/c\SystemdCgroup = true' /etc/containerd/config.toml
sudo systemctl restart containerd