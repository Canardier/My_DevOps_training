<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="Welcome_to_my_DevOps_training_project_0"></a>Welcome to my DevOps training project</h1>
<p class="has-line-data" data-line-start="1" data-line-end="3">I’m passionate about DevOps tools and practice.<br>
I am creating this project to learn how to use Terraform, besides I will implement the kubernetes cluster and other tools that I consider important like docker, Gitlab CI/CD, etc…</p>
<h2 class="code-line" data-line-start=4 data-line-end=5 ><a id="Tools_4"></a>Tools</h2>
<pre><code>Build
    - VirtualBox
    - Vagrant
    - Terraform
Config
    - Ansible
Container and his management
    - Docker
    - Kubernetes
Monitoring
    - Graphana
CI/CD
    - Gitlab CI/CD
</code></pre>
<h2 class="code-line" data-line-start=18 data-line-end=19 ><a id="Terraform_18"></a>Terraform</h2>
<p class="has-line-data" data-line-start="19" data-line-end="23">Documentation <a href="https://developer.hashicorp.com/terraform/cli">https://developer.hashicorp.com/terraform/cli</a><br>
<code>terraform init</code><br>
<code>terraform plan -out binary_file</code><br>
<code>terraform plan -out (Get-Date -Format "HHmmMMddyyyy") #On Windows, to get and id hours,minutes,day,month,year</code><br>
<code>terraform apply &quot;binary_file&quot;</code></p>

Go inside Ansible-box > create ssh key > copy in master/worker > Enjoy ansible 

## Kubernetes Doc
https://kubernetes.io/docs/reference/kubectl/quick-reference/
https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd

## Vagrant cmd
<code>vagrant global-status</code>
<code>vagrant ssh "machine id"</code>
<code>vagrant global-status --prune</code>

## Ansible cmd
in start create ssh key and send it to master en worker with 
<code>echo "y\n" | HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P ""</code>
<code>ssh-copy-id vagrant@192.168.10.10</code>
<code>ssh-copy-id vagrant@192.168.10.11</code>
<code>ansible-playbook -i inventory.yaml kube-dependencies.yaml</code>

# Worker cmd
create cluster with 
<code>kubeadm init --apiserver-advertise-address=192.168.10.10 --node-name=master --pod-network-cidr=192.168.100.0/24</code>
and install Calico as CNI

It is crucial to separate the IPs of the machines from those of the cluster to avoid address conflicts, ensure reliable communication between nodes and pods, enable proper routing, and prevent NAT errors that could disrupt Kubernetes.