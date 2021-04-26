#!/bin/bash
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
echo "192.168.1.0/24 via 192.168.253.2 dev eth2" > /etc/sysconfig/network-scripts/route-eth2
echo "192.168.2.0/24 via 192.168.254.2 dev eth3" > /etc/sysconfig/network-scripts/route-eth3
file=/etc/sysconfig/network-scripts/ifcfg-eth2:0
cp /etc/sysconfig/network-scripts/ifcfg-eth2 $file
sed -i 's/eth2/eth2:0/' $file
sed -i 's/IPADDR=.*/IPADDR=192.168.0.1/' $file
sed -i 's/NETMASK=.*/NETMASK=255.255.255.240/' $file
file=/etc/sysconfig/network-scripts/ifcfg-eth3:0
cp /etc/sysconfig/network-scripts/ifcfg-eth3 $file
sed -i 's/eth3/eth3:0/' $file
sed -i 's/IPADDR=.*/IPADDR=192.168.0.33/' $file
sed -i 's/NETMASK=.*/NETMASK=255.255.255.240/' $file
for interface in eth1 eth4; do 
cat > /etc/sysconfig/network-scripts/ifcfg-${interface} <<EOF
DEVICE=${interface}
ONBOOT=yes
BOOTPRORO=none
MASTER=bond0
SLAVE=yes
NM_CONTROLLED=no
USERCTL=no
EOF
done