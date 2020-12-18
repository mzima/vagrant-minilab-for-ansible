![logo](setup/logo/logo.png)
## Summary

Vagrant MiniLab is a Ansible lab environment based on Vagrant, Ansible and VirtualBox. The main folder contains Vagrant code to stand up multiple nodes (default: Ubuntu, CentOS, OpenSuSE). The number of nodes and the node OS is configurable by modifying the `config.yaml` file.

Additionally this lab environment also contains a dynamic inventory file which can be used to access the Vagrant nodes directly via Ansible without further configuration.

## Requirements

The pre-requisites are [Ansible](https://github.com/ansible/ansible), [Ansible host-manager plugin](https://github.com/devopsgroup-io/vagrant-hostmanager) , [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org), installed on the PC you intend to run it on, and 4 GB of RAM.

## Quickstart

### Installation
```
$ git clone https://github.com/mzima/vagrant-minilab-for-ansible
```

If not already present you also need to install the vagrant host-manager plugin:

```
$ vagrant plugin install vagrant-hostmanager
```

### Start
```
$ cd vagrant-minilab-for-ansible
$ vagrant up
```

### Ansible usage

The `env.sh` file configures the current Ansible environment (ansible.cfg, inventory) to automatically use Vagrant MiniLab.

```
$ source env.sh
$ ansible all -m ping --one-line
node3 | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, "changed": false, "ping": "pong"}
node1 | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, "changed": false, "ping": "pong"}
node2 | SUCCESS => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, "changed": false, "ping": "pong"}
```

### Halt / Destroy
```
$ vagrant halt
$ vagrant destroy
```

## Configuration

The main folder contains a `config.yaml` file, which can be used to configure the Vagrant MiniLab environment.

### config.yaml
```
# Lab settings
lab:
  domain: mini.lab
  provision: true

# Node settings
nodes:
  ubuntu:
    cpu: 1
    memory: 1024
    image: ubuntu/focal64
    hostname: node1
    setup: setup/nodes/debian.yml
  centos:
    cpu: 1
    memory: 1024
    image: centos/8
    hostname: node2
    setup: setup/nodes/rhel.yml
  suse:
    cpu: 1
    memory: 1024
    image: opensuse/Tumbleweed.x86_64
    hostname: node3
    setup: setup/nodes/suse.yml
```
