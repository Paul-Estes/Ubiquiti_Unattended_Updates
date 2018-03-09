@echo off
:Begin
ping -n 1 192.168.1.20
If %errorlevel% == 1 (
echo noreply
GoTo :Begin
)
If %errorlevel% == 0 (
GoTo :End
)
:End
::Uploads Configuration to UBNT Device
PSCP.EXE -scp -pw ubnt 42AndroidSE.cfg ubnt@192.168.1.20:/tmp/42AndroidSE.cfg
::Sending Configuration commands to UBNT Device
del eth.txt
plink -ssh -pw ubnt ubnt@192.168.1.20 "/sbin/ifconfig ath0 | grep HWaddr" > eth.txt
plink -ssh -pw ubnt ubnt@192.168.1.20 "/sbin/ifconfig eth0 | grep HWaddr" >> eth.txt
del 1firmware.txt
echo Firmware Version: > 1firmware.txt
plink -ssh -pw ubnt ubnt@192.168.1.20 "cat /etc/version" >> 1firmware.txt
plink -ssh -pw ubnt ubnt@192.168.1.20 "cat /tmp/42AndroidSE.cfg > /tmp/system.cfg"
plink -ssh -pw ubnt ubnt@192.168.1.20 "cfgmtd -w -p /etc/"
plink -ssh -pw ubnt ubnt@192.168.1.20 "reboot"
type eth.txt
type 1firmware.txt