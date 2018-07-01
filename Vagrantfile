# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

require 'rbconfig'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "opencv_examples" do |opencv_examples|
    opencv_examples.ssh.forward_agent = true
    opencv_examples.vm.box = "ubuntu/xenial64"
    opencv_examples.vm.network :forwarded_port, host: 4500, guest: 8000  # Web server
    opencv_examples.vm.network :forwarded_port, host: 8888, guest: 8888  # iPython notebook
    opencv_examples.vm.network :forwarded_port, host: 3307, guest: 3306  # mysql
    opencv_examples.vm.network :private_network, ip: "10.1.2.126"  # Change as you see fit
    opencv_examples.vm.hostname = 'opencv-examples'
    opencv_examples.vm.synced_folder ".", "/home/vagrant/opencv_examples", id: "vagrant-root"
    opencv_examples.vm.synced_folder ".", "/home/vagrant", disabled: true

    opencv_examples.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end

    opencv_examples.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/vagrant.yml"
    end
  end
end
