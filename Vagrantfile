# -*- mode: ruby -*-
# vi: set ft=ruby :

network_name = "vagrant-k8s"

Vagrant.configure(2) do |config|

  # Create the Kubernetes node VMs
  minions = []
  (1..1).each do |i|
    config.vm.define "node#{i}" do |node|
      minions.push "node#{i}"
      node.vm.box = "centos/7"
      node.vm.network :private_network,
                      :ip => "192.168.42.#{i+9}",
                      :libvirt__network_name => "#{network_name}",
                      :virtualbox__intnet => "#{network_name}"
      node.vm.provision "shell",
        inline: "echo Node #{i} VM created"
    end
  end

  # Create the Kubernetes and etcd master
  config.vm.define "master", primary: true do |master|
    master.vm.box = "centos/7"
    master.vm.network :private_network,
                      :ip => "192.168.42.6",
                      :libvirt__network_name => "#{network_name}",
                      :virtualbox__intnet => "#{network_name}"

    # Configure master and nodes via Ansible when the master is provisioned
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "kubernetes-ansible/setup.yml"
      ansible.groups = {
          "etcd" => ["master"],
          "masters" => ["master"],
          "minions" => minions,
      }
    end
  end
end
