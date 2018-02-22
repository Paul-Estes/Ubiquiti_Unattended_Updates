#! /usr/bin/fish

#Clearing old info from files
rm eth.txt
rm 1firmware.txt
#Push Configuration file to UBNT
sshpass -p ubnt scp 42VanSEnd.cfg ubnt@192.168.1.20:/tmp/
#Gather information for logging
sshpass -p ubnt ssh ubnt@192.168.1.20 /sbin/ifconfig ath0 | grep HWaddr > eth.txt
sshpass -p ubnt ssh ubnt@192.168.1.20 /sbin/ifconfig eth0 | grep HWaddr >> eth.txt
sshpass -p ubnt ssh ubnt@192.168.1.20 cat /etc/version >> 1firmware.txt
#Write config to default, save, and reboot.
sshpass -p ubnt ssh ubnt@192.168.1.20 "cat /tmp/42VanSEnd.cfg > /tmp/system.cfg"
sshpass -p ubnt ssh ubnt@192.168.1.20 cfgmtd -w -p /etc/
sshpass -p ubnt ssh ubnt@192.168.1.20 reboot
#Display collected info
cat eth.txt
cat 1firmware.txt