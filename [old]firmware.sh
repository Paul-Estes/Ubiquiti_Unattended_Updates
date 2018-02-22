#! /usr/bin/fish
sshpass -p ubnt scp XW-6.0.bin ubnt@192.168.1.20:/tmp
sshpass -p ubnt ssh ubnt@192.168.1.20 ubntbox fwupdate.real -m /tmp/XW-6.0.bin
