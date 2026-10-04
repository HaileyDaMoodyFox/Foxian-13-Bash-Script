#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root using sudo."
  exit 1
fi

clear

function Flatpak {
echo "Installing flatpak..."
{
apt install flatpak -y
apt install plasma-discover-backend-flatpak -y
apt install kde-config-flatpak -y
} &> /dev/null
echo "Flatpak installed!"
}

function Snaps {
echo "Installing Snaps..."
{
apt install snapd -y
apt install plasma-discover-backend-snap -y
apt install squashfs-tools -y
} &> /dev/null
echo "Snaps installed!"
sleep 4
}

function Backports {
echo "setting up Debian Backports..."
{
cp files/debian-backports.sources /etc/apt/sources.list.d/debian-backports.sources
apt update
apt upgrade
} &> /dev/null
echo "Debian Backports sucessfully setup!"
sleep 4
}

function foxianmain {
echo "removing applications..."
{
apt remove konqueror -y
apt remove kontrast -y
apt remove juk -y
apt remove akregator -y
apt remove dragonplayer -y
apt remove xterm -y
apt remove kdeconnect -y
apt remove kmail -y
apt remove korganizer -y
apt remove kaddressbook -y
apt remove kmouth -y
apt remove kwrite -y
apt remove sweeper -y
apt remove kmousetool -y
apt remove kmag -y
apt remove kfind -y
apt remove khelpcenter -y
apt remove kwalletmanager -y
} &> /dev/null
while true; do
    echo "You want to install Flatpak Flathub on your system?"
    echo "1) Yes"
    echo "2) No"
    read -p "Enter choice [1-2]: " choice
case $choice in
    1) Flatpak; break;;
    2) echo "abborted."; break;;
    *) echo "Invalid option. Try again.";;
esac
    echo
done

while true; do
    echo "You want to install Snaps on your system?"
    echo "1) Yes"
    echo "2) No"
    read -p "Enter choice [1-2]: " choice
case $choice in
    1) Snaps; break;;
    2) echo "abborted."; break;;
    *) echo "Invalid option. Try again.";;
esac
    echo
done

while true; do
    echo "You want to setup Debian Backports on your system?"
    echo "1) Yes"
    echo "2) No"
    read -p "Enter choice [1-2]: " choice
case $choice in
    1) Backports; break;;
    2) echo "abborted."; break;;
    *) echo "Invalid option. Try again.";;
esac
    echo
done

echo "Installing applications..."
{
apt install virt-manager -y
apt install syncthing -y
apt install plasma-wayland-protocols -y
apt install partitionmanager -y
apt install ark -y
apt install kde-config-plymouth -y
apt install plymouth-themes -y
apt install gocryptfs -y
apt install plasma-calendar-addons -y
apt install tmux -y
apt install fastfetch -y
apt install konsole -y
apt install isoimagewriter -y
apt install k3b -y
apt install kate -y
apt install krita -y
apt install kdenlive -y
apt install okular -y
apt install kcalc -y
apt install merkuro -y
#apt install retext -y
apt install deja-dup -y
apt install papirus-icon-theme -y
apt install keepassxc -y
apt install vlc -y
apt install libreoffice -y
#apt install gimp -y
#apt install inkscape -y
apt install eartag -y
apt install audacity -y
apt install obs-studio -y
apt install handbrake -y
} &> /dev/null
echo "installing FOSS games..."
{
apt install woof-doom -y
apt install freedoom -y
apt install supertux -y
apt install supertuxkart -y
apt autoremove -y
} &> /dev/null
echo "Finishing up..."

clear
echo Your system has been setup! Yip Yip! Yarp! :3

}

while true; do
    echo "  _____ _____  _____    _    _   _    _ _____   "
    echo " |  ___/ _ \ \/ /_ _|  / \  | \ | |  / |___ /   "
    echo " | |_ | | | \  / | |  / _ \ |  \| |  | | |_ \   "
    echo " |  _|| |_| /  \ | | / ___ \| |\  |  | |___) |  "
    echo " |_|   \___/_/\_\___/_/   \_\_| \_|  |_|____/   "
    echo "                                                "
    echo "A Post-Install Script for Debian 13 Trixie!"
    echo ""
    echo "1) Start"
    echo "2) Exit"
    read -p "Enter choice [1-2]: " choice
case $choice in
    1) foxianmain;;
    2) echo "Exiting script."; break;;
    *) echo "Invalid option. Try again.";;
esac
    echo
done

#{} &> /dev/null
