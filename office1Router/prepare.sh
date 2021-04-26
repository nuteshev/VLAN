#!/bin/bash
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 			
file=/etc/sysconfig/network-scripts/ifcfg-eth4:0
cp /etc/sysconfig/network-scripts/ifcfg-eth4 $file
sed -i 's/eth4/eth4:0/' $file
sed -i 's/IPADDR=.*/IPADDR=192.168.254.2/' $file
sed -i 's/NETMASK=.*/NETMASK=255.255.255.252/' $file
echo "GATEWAY=192.168.254.1" >> $file