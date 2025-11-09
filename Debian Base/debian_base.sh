#!/bin/bash
# Script to set up a Debian 13 KDE installation

# Script setup
# Make temp folder for installation files
echo 'Git configuration'
echo '======================================================================='
echo 'This script will be installing Git, and as part of the setup, you will need to provide your name and email address.'
echo 'What is your name?'
read username
echo 'What is your email?'
read useremail
echo Thanks $username, and Ill set your email as $useremail
echo '======================================================================='

printf 'Creating temporary folders for installers'
echo '======================================================================='
mkdir ~/Installers
echo '======================================================================='

# NVIDIA Drivers
echo 'NVIDIA Driver Prep'
echo '======================================================================='
echo 'Enabling Non-Free Repos'
echo '======================================================================='
sudo sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list

# Install Flatpak
echo 'Installing Flatpak support'
echo '======================================================================='
sudo apt install flatpak
sudo apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo '======================================================================='

# Add Google Chrome repo
echo 'Adding Google Chrome repo'
echo '======================================================================='
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo '======================================================================='

# Grab installation files needed
echo 'Downloading Discord .deb package'
echo '======================================================================='
wget -O ~/Installers/discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
echo '======================================================================='

echo 'Downloading Git Credential Manager release from Github'
echo '======================================================================='
gcm_url=$(curl -s https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest | jq -r '(.assets[].browser_download_url | select(. | contains(".deb")))')
wget -O ~/Installers/gcm.deb $gcm_url
echo '======================================================================='

echo 'Downloading latest Dopamine release from GitHub'
echo '======================================================================='
dopamine_url=$(curl -s https://api.github.com/repos/digimezzo/dopamine/releases/latest | jq -r '(.assets[].browser_download_url | select(. | contains(".deb")))')
wget -O ~/Installers/dopamine.deb $dopamine_url
echo '======================================================================='

echo 'Downloading latest Dopamine release from GitHub'
echo '======================================================================='
obsidian_url=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '(.assets[].browser_download_url | select(. | contains("_amd64.deb")))')
wget -O ~/Installers/obsidian.deb $obsidian_url
echo '======================================================================='

echo 'Downloading latest Steam installer'
echo '======================================================================='
wget -O ~/Installers/steam.deb 'https://cdn.akamai.steamstatic.com/client/installer/steam.deb'
echo '======================================================================='

# Update repos
echo 'Updating repos'
echo '======================================================================='
sudo apt update -y
echo '======================================================================='

# Install apps

# Install Flatpaks
echo 'Installing PokeMMO (Flatpak)'
echo '======================================================================='
flatpak install -y com.pokemmo.PokeMMO
echo '======================================================================='

# Install from repo
echo 'Installing Java Runtime Environment'
echo '======================================================================='
sudo apt install -y default-jre
echo '======================================================================='

echo 'Installing NotepadQQ'
echo '======================================================================='
sudo apt install notepadqq
echo '======================================================================='

echo 'Installing Google Chrome'
echo '======================================================================='
sudo apt-get install google-chrome-stable
echo '======================================================================='

echo 'Installing Git'
echo '======================================================================='
sudo apt-get git
git config --global user.email $useremail
git config --global user.name $username
echo '======================================================================='

# Install .deb files
echo 'Installing Discord'
echo '======================================================================='
sudo dpkg -i ~/Installers/discord.deb
echo '======================================================================='

echo 'Installing Steam'
echo '======================================================================='
sudo dpkg -i ~/Installers/steam.deb 
echo '======================================================================='

echo 'Installing Dopamine'
echo '======================================================================='
sudo dpkg -i ~/Installers/dopamine.deb
echo '======================================================================='

echo 'Installing Obsidian'
echo '======================================================================='
sudo dpkg -i ~/Installers/dopamine.deb
echo '======================================================================='

echo 'Installing/Configuring Git Credential Manager'
echo '======================================================================='
sudo dpkg -i ~/Installers/gcm.deb
git-credential-manager configure
export GCM_CREDENTIAL_STORE=secretservice
git config --global credential.credentialStore secretservice
echo '======================================================================='

# Configure and install NVIDIA driver
echo 'Installing NVIDIA driver and building kernel module'
echo '======================================================================='
sudo apt install nvidia-driver nvidia-kernel-dkms
echo '======================================================================='

# Finally remove the temp folder
echo 'Clearing up installers'
echo '======================================================================='
rm -rf ~/Installers

echo 'Script complete! Enjoy!'
echo 'You NEED to reboot the computer to finish installation!'
