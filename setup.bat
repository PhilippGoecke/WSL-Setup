Rem Show Windows Version (Windows 10 version 2004 or greater for WSL2)
wmic os get version

Rem Source: https://docs.microsoft.com/en-us/windows/wsl/install-manual

Rem Enable the Windows Subsystem for Linux (WSL1)
Rem WSL1&2 diff https://docs.microsoft.com/en-us/windows/wsl/compare-versions
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Rem Enable Virtual Machine feature (WSL1 -> WSL2)
Rem https://docs.microsoft.com/en-us/windows/wsl/install-win10#update-to-wsl-2
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Enable Hyper-V on Windows 10
# https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v
dism.exe /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V

Rem Set WSL 2 as your default version
wsl --set-default-version 2

Rem install debian
Rem Source: https://docs.microsoft.com/en-us/windows/wsl/install-manual#downloading-distributions
start "" https://www.microsoft.com/en-us/p/debian/9msvkqc78pk6
curl.exe -L -o debian.appx https://aka.ms/wsl-debian-gnulinux
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Add-AppxPackage .\debian.appx"
# wsl --export Debian debian.tar
# wsl --import DebianRails .\DebianRails debian.tar
# wsl --import DebianRails .\DebianRails debian.tar --version 2
# wsl -d DebianRails # start WSL Kontext
# wsl --unregister DebianRails # delete WSL Kontext

Rem Reboot evtl. nötig

Rem Beim ersten start Benutzername und Passwort festlegen

Rem Source: https://wiki.debian.org/InstallingDebianOn/Microsoft/Windows/SubsystemForLinux

Rem check WSL version
wsl -l -v
Rem set WSL Version
wsl --set-version Debian 2
Rem remove WSL Kontext
wsl --unregister Debian
