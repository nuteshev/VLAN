#!/bin/bash
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.
iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
for interface in eth1 eth2; do 
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
echo "192.168.0.0/16 via 192.168.255.2 dev bond0" > /etc/sysconfig/network-scripts/route-bond0