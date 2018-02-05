#! /bin/bash
apt-get update
# apt-get install ubuntu-gnome-desktop
# apt-get install vim-gnome
apt-get install xubuntu-desktop
apt-get install xfce4-goodies
wget "https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb"
dpkg --install chrome-remote-desktop_current_amd64.deb
apt-get -f install

# http://remotedesktop.google.com/headless
# /opt/google/chrome-remote-desktop/start-host --code="4/1_ibBMfignSYHf3f8nzT-UuVG3DKRlM0djXdWNAQgls" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --pin 434755 --name=tlgn
# /opt/google/chrome-remote-desktop/chrome-remote-desktop --start -s 3840x2160

ssh-keygen -t rsa -b 4096 -C "tangbotu@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add -K ~/.ssh/id_rsa

git clone git@github.com:makestuffwork/my_ubuntu_setup.git

apt-get install vim-gtk

# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
# sudo apt-get update
# sudo apt-get install google-chrome-stable
