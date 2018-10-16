# vagrant-centos

Basic vagrant configuration for a CentOS VM.

# Requirements

- [https://www.vagrantup.com/](Vagrant by HashiCorp)

# Getting Started

Read the Vagrant documentation.

- [https://www.vagrantup.com/intro/index.html](Intro)
- [https://www.vagrantup.com/docs/index.html](Docs)

Clone the git repo

    git clone git@github.com:jakup/vagrant-centos.git

Run vagrant up

    vagrant up

# Modular file based provisioning scripts

Vagrant supports many types of provisioners.  This project uses a simple file based approach.  Any files in `vagrant.d-enabled` with a filename matching `*.sh` will be executed after the VM starts up.

I have placed scripts for several applications that I commonly use in `vagrant.d-available` and most scripts that I most always have enabled are already symlinked in `vagrant.d-enabled`.
