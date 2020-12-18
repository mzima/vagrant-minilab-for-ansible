#!/usr/bin/perl
#
# Vagrantfile
#

require 'ipaddr'

lab_dir = __dir__

Vagrant.configure("2") do |config|
    # hostmanager plugin configuration
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = false
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    # load config file
    config_file = YAML.load_file("#{lab_dir}/config.yaml")

    # fetch lab configuration
    lab_domain = config_file.fetch('lab').fetch('domain')
    lab_provision = config_file.fetch('lab').fetch('provision')

    # node provisioning
    nodes = config_file.fetch('nodes')
    ip_start = 10
    nodes.each do |os, item|
    	ip = "192.168.100.#{ip_start}"
        hostname = item['hostname']
        hostname_fqdn = hostname + "." + lab_domain
        config.vm.define hostname do |node|
            node.vm.box = item['image']
            node.vm.provider :virtualbox do |v|
                v.cpus = item['cpu']
                v.memory = item['memory']
            end
            node.vm.hostname = hostname_fqdn
            node.vm.network "private_network", ip: ip, virtualbox__intnet: true
            node.hostmanager.aliases = [hostname, hostname_fqdn]
            if lab_provision
                # Ansible provisioning
                node.vm.provision "ansible" do |ansible|
                    ansible.playbook = item['setup']
                end
            end
        end
        ip_start += 1
    end
end
