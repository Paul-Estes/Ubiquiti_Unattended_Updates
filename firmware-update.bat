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
echo y |PSCP.EXE -scp -pw ubnt XW.bin ubnt@192.168.1.20:/tmp
PLINK.EXE -ssh -l ubnt -pw ubnt 192.168.1.20 "ubntbox fwupdate.real -m /tmp/XW.bin"
echo Firmware Update Complete
echo Please Upload Appropriate Configuration Next