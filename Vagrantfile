# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
  Vagrant.configure("2") do |config| 
    #config.vm.box = "centos/7" 
    #config.vm.box_version = "2011.0"
    config.vm.box = "ekko919/CentOS-8.x"
    config.vm.box_version = "2023.05.16" 
    config.vm.provider "virtualbox" do |v| 
    v.memory = 512 
    v.cpus = 2 
  end
  #config.vm.box_version = "1804.02"
  config.vm.define "lab7" do |lab7| 
    lab7.vm.network "private_network", type: "dhcp" 
    lab7.vm.hostname = "lab7"
    lab7.vm.provision "shell" , path: "script.sh"
  end
end
