#!/bin/bash
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
echo "GATEWAY=192.168.2.65" >> /etc/sysconfig/network-scripts/ifcfg-eth1
modprobe 8021q
 


