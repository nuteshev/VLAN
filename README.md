Тестирование работы VLAN: 
```
[vagrant@testClient1 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 75648sec preferred_lft 75648sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:93:d6:43 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.67/26 brd 192.168.2.127 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe93:d643/64 scope link
       valid_lft forever preferred_lft forever
4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:fe:c3:f3 brd ff:ff:ff:ff:ff:ff
5: vlan5@eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:fe:c3:f3 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.254/24 brd 10.10.10.255 scope global vlan5
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fefe:c3f3/64 scope link
       valid_lft forever preferred_lft forever
[vagrant@testClient1 ~]$ ping 10.10.10.1
PING 10.10.10.1 (10.10.10.1) 56(84) bytes of data.
64 bytes from 10.10.10.1: icmp_seq=1 ttl=64 time=0.678 ms
64 bytes from 10.10.10.1: icmp_seq=2 ttl=64 time=0.466 ms
64 bytes from 10.10.10.1: icmp_seq=3 ttl=64 time=0.470 ms
64 bytes from 10.10.10.1: icmp_seq=4 ttl=64 time=0.549 ms
^C
--- 10.10.10.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3000ms
rtt min/avg/max/mdev = 0.466/0.540/0.678/0.090 ms
```

```
[vagrant@testServer1 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 75404sec preferred_lft 75404sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:1c:3b:b5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.69/26 brd 192.168.2.127 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe1c:3bb5/64 scope link
       valid_lft forever preferred_lft forever
4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:68:6c:00 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::5472:2756:3ade:c6f4/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
5: vlan5@eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:68:6c:00 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.1/24 brd 10.10.10.255 scope global vlan5
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe68:6c00/64 scope link
       valid_lft forever preferred_lft forever
[vagrant@testServer1 ~]$ ping 10.10.10.254
PING 10.10.10.254 (10.10.10.254) 56(84) bytes of data.
64 bytes from 10.10.10.254: icmp_seq=1 ttl=64 time=0.519 ms
64 bytes from 10.10.10.254: icmp_seq=2 ttl=64 time=0.558 ms
64 bytes from 10.10.10.254: icmp_seq=3 ttl=64 time=0.518 ms
^C
--- 10.10.10.254 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1999ms
rtt min/avg/max/mdev = 0.518/0.531/0.558/0.032 ms
```

```
[vagrant@testServer2 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 75314sec preferred_lft 75314sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:53:b1:4b brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.70/26 brd 192.168.2.127 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe53:b14b/64 scope link
       valid_lft forever preferred_lft forever
4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:e0:b2:b0 brd ff:ff:ff:ff:ff:ff
5: vlan6@eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:e0:b2:b0 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.1/24 brd 10.10.10.255 scope global vlan6
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fee0:b2b0/64 scope link
       valid_lft forever preferred_lft forever
[vagrant@testServer2 ~]$ ping 10.10.10.254
PING 10.10.10.254 (10.10.10.254) 56(84) bytes of data.
64 bytes from 10.10.10.254: icmp_seq=1 ttl=64 time=0.829 ms
64 bytes from 10.10.10.254: icmp_seq=2 ttl=64 time=0.672 ms
64 bytes from 10.10.10.254: icmp_seq=3 ttl=64 time=0.793 ms
^C
--- 10.10.10.254 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2001ms
rtt min/avg/max/mdev = 0.672/0.764/0.829/0.074 ms
```

```
[vagrant@testClient2 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 80807sec preferred_lft 80807sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:f8:7f:05 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.68/26 brd 192.168.2.127 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fef8:7f05/64 scope link
       valid_lft forever preferred_lft forever
4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:a4:f3:88 brd ff:ff:ff:ff:ff:ff
5: vlan6@eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:a4:f3:88 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.254/24 brd 10.10.10.255 scope global vlan6
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fea4:f388/64 scope link
       valid_lft forever preferred_lft forever
[vagrant@testClient2 ~]$ ping 10.10.10.1
PING 10.10.10.1 (10.10.10.1) 56(84) bytes of data.
64 bytes from 10.10.10.1: icmp_seq=1 ttl=64 time=0.730 ms
64 bytes from 10.10.10.1: icmp_seq=2 ttl=64 time=0.706 ms
64 bytes from 10.10.10.1: icmp_seq=3 ttl=64 time=0.608 ms
^C
--- 10.10.10.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 0.608/0.681/0.730/0.056 ms
```

Тестирование работы Bond:
```
[root@inetRouter ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 86273sec preferred_lft 86273sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast master bond0 state UP group default qlen 1000
    link/ether 08:00:27:30:61:0f brd ff:ff:ff:ff:ff:ff
4: eth2: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast master bond0 state UP group default qlen 1000
    link/ether 08:00:27:70:20:45 brd ff:ff:ff:ff:ff:ff
5: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:30:61:0f brd ff:ff:ff:ff:ff:ff
    inet 192.168.255.1/30 brd 192.168.255.3 scope global bond0
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe30:610f/64 scope link
       valid_lft forever preferred_lft forever
[root@inetRouter ~]# ping centralRouter
PING centralRouter (192.168.255.2) 56(84) bytes of data.
64 bytes from centralRouter (192.168.255.2): icmp_seq=1 ttl=64 time=0.564 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=2 ttl=64 time=0.585 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=3 ttl=64 time=0.452 ms
^C
--- centralRouter ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 0.452/0.533/0.585/0.064 ms
[root@inetRouter ~]# ifdown eth1
[root@inetRouter ~]# ping centralRouter
PING centralRouter (192.168.255.2) 56(84) bytes of data.
64 bytes from centralRouter (192.168.255.2): icmp_seq=1 ttl=64 time=0.816 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=2 ttl=64 time=0.466 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=3 ttl=64 time=0.663 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=4 ttl=64 time=0.354 ms
^C
--- centralRouter ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3002ms
rtt min/avg/max/mdev = 0.354/0.574/0.816/0.180 ms
[root@inetRouter ~]# ifdown eth2
[root@inetRouter ~]# ping centralRouter
PING centralRouter (192.168.255.2) 56(84) bytes of data.
From inetRouter (192.168.255.1) icmp_seq=1 Destination Host Unreachable
From inetRouter (192.168.255.1) icmp_seq=2 Destination Host Unreachable
From inetRouter (192.168.255.1) icmp_seq=3 Destination Host Unreachable
From inetRouter (192.168.255.1) icmp_seq=4 Destination Host Unreachable
^C
--- centralRouter ping statistics ---
5 packets transmitted, 0 received, +4 errors, 100% packet loss, time 4003ms
pipe 4
[root@inetRouter ~]# ifup eth1
[root@inetRouter ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 86211sec preferred_lft 86211sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast master bond0 state UP group default qlen 1000
    link/ether 08:00:27:30:61:0f brd ff:ff:ff:ff:ff:ff
4: eth2: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether 08:00:27:70:20:45 brd ff:ff:ff:ff:ff:ff
5: bond0: <BROADCAST,MULTICAST,MASTER> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 08:00:27:30:61:0f brd ff:ff:ff:ff:ff:ff
    inet 192.168.255.1/30 brd 192.168.255.3 scope global bond0
       valid_lft forever preferred_lft forever
[root@inetRouter ~]# ifup bond0
[root@inetRouter ~]# ping centralRouter
PING centralRouter (192.168.255.2) 56(84) bytes of data.
64 bytes from centralRouter (192.168.255.2): icmp_seq=1 ttl=64 time=0.807 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=2 ttl=64 time=0.627 ms
64 bytes from centralRouter (192.168.255.2): icmp_seq=3 ttl=64 time=0.583 ms
^C
--- centralRouter ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 0.583/0.672/0.807/0.099 ms
```
