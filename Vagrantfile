# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_x11 = true

  config.vm.box = "raring-min"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [ "apt",
                      "java",
                      "android-sdk",
                      "zsh",
                      "git",
                      "tmux",
                      "emacs"
                    ]

    chef.json = {
      "emacs" => {
        "packages" => ["emacs24"]
      }
    }

    chef.log_level = :debug
  end
  config.vm.provision :shell do |shell|
    shell.path = "./script.sh"
  end
end
