# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
 
  config.vm.define "server1" do |server|
    server.vm.box = "ubuntu/bionic64"
    server.vm.hostname = "server1"
    server.vm.network "private_network", ip: "192.168.50.20"
    server.vm.provision "shell", path: "init.sh"
  end
 
end
