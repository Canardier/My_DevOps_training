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

resource "vagrant_vm" "master" {
  vagrantfile_dir = "./master"
  env = {
    name = "master"
    ip_address = "192.168.10.10"
    vm_hostname = "master"
  }
  get_ports = true
}

resource "vagrant_vm" "worker" {
  vagrantfile_dir = "./worker"
  env = {
    name = "worker-${count.index + 1}"
    ip_address = "192.168.10.${count.index + 11}"
    vm_hostname = "worker-${count.index + 1}"
  }
  get_ports = true
  count = 2
}