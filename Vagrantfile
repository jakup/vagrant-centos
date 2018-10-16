# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.synced_folder "shared", "/mnt/shared"

  config.vm.network "private_network", ip: "10.13.37.123"
  config.vm.host_name = "centos-test.local"
  config.vm.provider "virtualbox" do |v|
    v.name = "centos-test"
    v.memory = "2048"
    v.cpus = 2
    v.linked_clone = true
  end

  # enable yum cache so we don't have to download the same packages again and again when reprovisioning the vm
  FileUtils.mkdir_p ".cache/yum"
  config.vm.synced_folder ".cache/yum", "/var/cache/yum"
  config.vm.provision :shell, inline: <<-'SHELL'
    cp /etc/yum.conf /etc/yum.conf.orig
    cat /etc/yum.conf.orig \
        | grep -Ev '^keepcache=' \
        | sed 's/^\[main\]$/[main]\nkeepcache=1/' \
        > /etc/yum.conf
  SHELL

  Dir["vagrant.d-enabled/*.sh"].sort().each do |f|
    config.vm.provision :shell, path: f
  end
end
