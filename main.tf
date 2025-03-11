terraform {
  required_providers {
    vagrant = {
      source  = "bmatcuk/vagrant"
      version = "~> 4.0.0"
    }
  }
}

provider "vagrant" {
  # no config
}

resource "vagrant_vm" "worker" {
  vagrantfile_dir = "./worker"
  env = {
    ip_address = "192.168.10.${count.index + 11}"
    vm_hostname = "worker-${count.index}"
  }
  count = 2
  depends_on = [vagrant_vm.master]
  get_ports = true
}

resource "vagrant_vm" "master" {
  vagrantfile_dir = "./master"
  env = {
    ip_address = "192.168.10.10"
    vm_hostname = "master"
  }
  get_ports = true
}

resource "vagrant_vm" "ansible" {
  vagrantfile_dir = "./ansible_box"
  env = {
    ip_address = "192.168.10.1"
    vm_hostname = "ansible"
  }
  get_ports = true
  depends_on = [vagrant_vm.worker]
}

output "worker_ips" {
  value = [for i in range(var.worker_count) : "192.168.10.${i + 11}"]
}