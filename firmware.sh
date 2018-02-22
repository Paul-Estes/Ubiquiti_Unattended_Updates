#! /usr/bin/fish
#Notes for future Updates, Variables, etc...
set fwtype (sshpass -p ubnt ssh ubnt@192.168.1.20 "cat /etc/version | cut -c 1-2")
echo "Ubuiquiti AP is running $fwtype hardware."
echo "Updating Firmware..."
if [ "$fwtype" = "XW" ];
        sshpass -p ubnt scp XW.bin ubnt@192.168.1.20:/tmp
        sshpass -p ubnt ssh ubnt@192.168.1.20 ubntbox fwupdate.real -m /tmp/XW.bin
        end
if [ "$fwtype" = "XM" ];
        sshpass -p ubnt scp XM.bin ubnt@192.168.1.20:/tmp
        sshpass -p ubnt ssh ubnt@192.168.1.20 ubntbox fwupdate.real -m /tmp/XM.bin
        end
