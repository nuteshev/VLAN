# -*- mode: ruby -*-
# vim: set ft=ruby :
# -33:37

MACHINES = {
:inetRouter => {
        :box_name => "centos/7",
        #:public => {:ip => '10.10.10.1', :adapter => 1},
        :net => [
                   {adapter: 2, virtualbox__intnet: "router-net"}, # связь с centralRouter
				   {adapter: 3, virtualbox__intnet: "router-net"}, # связь с centralRouter
                ]
  },
  :centralRouter => {
        :box_name => "centos/7",
        :net => [
                   {adapter: 2, virtualbox__intnet: "router-net"}, # связь с inetRouter
				   {ip: '192.168.254.1', adapter: 4, netmask: "255.255.255.252", virtualbox__intnet: "hw-net"}, # связь с office1Router
				   {ip: '192.168.253.1', adapter: 3, netmask: "255.255.255.252", virtualbox__intnet: "dir-net"}, # связь с office2Router
                  # {ip: '192.168.0.1', adapter: 3, netmask: "255.255.255.240", virtualbox__intnet: "dir-net"}, # этот адрес вручную прописан ниже в ifcfg-eth2:0
                  # {ip: '192.168.0.33', adapter: 4, netmask: "255.255.255.240", virtualbox__intnet: "hw-net"}, # а этот в ifcfg-eth3:0
                   {adapter: 5, virtualbox__intnet: "router-net"},
                ]
  },
  
   :office1Router => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.2.1', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office1-dev-net"},
				 #  {ip: '192.168.254.2', adapter: 5, netmask: "255.255.255.252", virtualbox__intnet: "hw-net"}, # связь с centralRouter, прописана ниже вручную в ifcfg-eth4:0
                   {ip: '192.168.2.65', adapter: 3, netmask: "255.255.255.192", virtualbox__intnet: "office1-test-net"},
                   {ip: '192.168.2.129', adapter: 4, netmask: "255.255.255.192", virtualbox__intnet: "managers-net"},
                   {ip: '192.168.2.193', adapter: 5, netmask: "255.255.255.192", virtualbox__intnet: "hw-net"},
                ]
  },
  :testClient1 => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.2.67', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office1-test-net"},
                   {adapter: 3, virtualbox__intnet: "testLAN"},
                ]
  },
  :testClient2 => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.2.68', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office1-test-net"},
                   {adapter: 3, virtualbox__intnet: "testLAN"},
                ]
  },
   :testServer1 => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.2.69', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office1-test-net"},
                   {adapter: 3, virtualbox__intnet: "testLAN"},
                ]
  },
   :testServer2 => {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.2.70', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "office1-test-net"},
                   {adapter: 3, virtualbox__intnet: "testLAN"},
                ]
  },
  
}


class FixGuestAdditions < VagrantVbguest::Installers::Linux
    def install(opts=nil, &block)
        communicate.sudo("yum update kernel -y; yum install -y gcc binutils make perl bzip2 kernel-devel kernel-headers", opts, &block)
        super
    end
end

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|
	config.vbguest.installer = FixGuestAdditions
    config.vm.define boxname do |box|

        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s

        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end
        
        if boxconfig.key?(:public)
          box.vm.network "public_network", boxconfig[:public]
        end
		
		box.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "192"]
        end
		  
		box.vm.provision "ansible" do |ansible|
			ansible.playbook = "playbook.yml"
			ansible.become = "true"
		end

      end

  end
  
  
end