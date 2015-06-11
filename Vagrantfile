# -*- mode: ruby -*-
# vi: set ft=ruby :


# Currently assumes the Fedora 22 image has been dowloaded from
# http://download.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-libvirt.box

network_name = "vagrant-k8s"

Vagrant.configure(2) do |config|

  # F22 box isn't currently automatically updatable
  config.vm.box_check_update = false

  # Sets up a Kubernetes master and 2 nodes on a shared network
  # TODO: Use Ansible to actually do the configuration

  config.vm.define "master", primary: true do |master|
    master.vm.box = "fedora-22"
    master.vm.network :private_network,
                      :ip => "192.168.42.6",
                      :libvirt__network_name => "#{network_name}",
                      :virtualbox__intnet => "#{network_name}"
    master.vm.provision "shell", inline: 'echo Hello from master'
  end

  # TODO: Define multiple nodes in a loop
  config.vm.define "node1" do |node1|
    node1.vm.box = "fedora-22"
    node1.vm.network :private_network,
                     :ip => "192.168.42.9",
                     :libvirt__network_name => "#{network_name}",
                     :virtualbox__intnet => "#{network_name}"
    node1.vm.provision "shell", inline: 'echo Hello from node1'
  end

  config.vm.provision "shell", inline: 'echo Hello from outer config'

end
