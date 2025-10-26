#!/bin/bash
# Script to set up a Zorin 18 installation

# Script setup
# Make temp folder for installation files
mkdir ~/Installers

# Grab installation files needed
echo 'Downloading Discord .deb package'
wget -O ~/Installers/discord.deb 'https://discord.com/api/download?platform=linux&format=deb'

echo 'Downloading latest Lutris release from GitHub'
lutris_url=$(curl -s https://api.github.com/repos/lutris/lutris/releases/latest | jq -r '(.assets[].browser_download_url | select(. | contains("_all.deb")))')
wget -O ~/Installers/lutris.deb $lutris_url

echo 'Downloading latest Steam installer'
wget -O ~/Installers/steam.deb 'https://cdn.akamai.steamstatic.com/client/installer/steam.deb'

# Add repos
echo 'Adding OBS PPA repository'
add-apt-repository -y ppa:obsproject/obs-studio

echo 'Adding XIVLauncher PPA repository'
sudo add-apt-repository -y ppa:linneris/xivlauncher-core-stable

# Update repos
sudo apt update -y

# Install apps
echo 'Installing Java Runtime Environment'
sudo apt install -y default-jre

echo 'Installing Discord'
sudo dpkg -i ~/Installers/discord.deb

echo 'Installing Lutris'
sudo dpkg -i ~/Installers/lutris.deb
sudo apt --fix-broken install

echo 'Installing Steam'
sudo dpkg -i ~/Installers/steam.deb

echo 'Installing OBS'
sudo apt install -y obs-studio

echo 'Installing XIVLauncher'
sudo apt install -y xivlauncher-core

echo 'Installing PokeMMO (Flatpak)'
flatpak install -y com.pokemmo.PokeMMO

echo 'Installing Cartridges'
flatpak install -y flathub page.kramo.Cartridges

# Finally remove the temp folder
echo 'Clearing up installers'
rm -rf ~/Installers

echo 'Script complete! Enjoy!'
