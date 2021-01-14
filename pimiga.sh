
#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
#
# -language set for GB,DE,IT,ES..
# -OLED DISPLAY Amiga þ- bootpic... amyberry, amibian, Amiga Logo
# -since USBþStick possible... update BOOT and script create USBSTick (PI400) 
# -Cusom Webserver, RaspiControl, ( Lights, FAN, OLED;...) -> WebAdmin is overkill
# -Preinstalled ClassicWB for amyberry..... -> extract HDF to folder for easy acces from Linux
# -Amibian Colour Menue in Amiga colours - consultation with G.K -> OK
# -rename the Amibian Version of raspi-config ( Update proof) - consultation with G.K -> 
# Useful PiKiss Modules, CoolTerm, Certificates....stuff
# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 

if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Pleas don't use 'sudo !!'"
      exit 1
fi


echo " "
echo " "
echo " "

echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start a upgrade.... sit down and relaxe...!"
echo " "
echo "Backup Settings...."


#mkdir /home/$USER/.backup/
#sudo mkdir /home/$USER/.backup/usr/
#sudo chmod -R 777 ~/.backup/

#sudo cp -R ~/.config/ ~/.backup/.config
#sudo cp -R ~/.local/ ~/.backup/.local
#sudo cp -R /usr/local/bin ~/.backup/usr

cd ~/Pimiga_mini

#echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
# Todo create a clean Menu
unzip ~/Pimiga_mini/.data.pac
#rm -r ~/.config/lxpanel ~/.config/lxsession ~/.config/lxterminal

#mv ~/Pimiga_mini/.data/.config/lxpanel ~/.config/lxpanel
#mv ~/Pimiga_mini/.data/.config/lxsession ~/.config/lxsession
#mv ~/Pimiga_mini/.data/.config/lxterminal ~/.config/lxterminal



echo "Time to update:) "
sudo apt-get -y update 
sudo apt-get -y upgrade

#xfce Desktop
#echo "XfCE4 install possible.....# if if whished:) "
sudo apt-get -y remove --auto-remove xserver-common*
sudo apt-get -y sudo apt-get purge openbox
sudo apt-get -y sudo apt-get purge lxde

sudo apt install -y xserver-xorg xfce4 
sudo apt install -y xfce4-goodies
sudo apt install -y xfce4-utils
sudo apt install -y mc git gparted synaptic geany geany-plugins-common geany-common
apt install -y dialog
#sudo dpkg-reconfigure lightdm

#restore.....#  if needed:) "
#sudo cp -R  /home/amibian/.backup/ usr/local/bin
cd ~

#Some little Tweaks....
#sudo apt-get -y install openbox-menu  obconf obconf-qt obmenu imagemagick
sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
sudo apt-get install -y libraspberrypi-dev

#Some little Amiga stuff....
sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms

sudo chmod -R 777 /usr/local/bin/
sudo chmod -R 777 /usr/local/share/
cd ~


#Install Retropie/Setup

#sudo apt-get install -y git dialog unzip xmlstarlet
#git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
#sudo chmod -R 777 /home/amibian/RetroPie-Setup/
#cd /home/amibian/RetroPie-Setup

#sudo __nodialog=1 ./retropie_packages.sh setup basic_install
#sudo __nodialog=1 ./retropie_packages.sh setup amiberry
#sudo __nodialog=1 ./retropie_packages.sh setup vice
#sudo __nodialog=1 ./retropie_packages.sh setup lr-vice
#sudo __nodialog=1 ./retropie_packages.sh setup giana
#sudo __nodialog=1 ./retropie_packages.sh setup eduke32

# Install Amiberry Raspberry Pi with SDL2 + DispmanX

cd ~
 
  git clone https://github.com/midwan/amiberry
  cd amiberry
  make -j2 PLATFORM=rpi4
  sudo chmod -R 777 /home/amibian/amiberry

  
  # Preinstall Classic WB UAE
  mkdir /home/$USER/Amiga
  mkdir /home/$USER/Amiga/HDD
  mkdir /home/$USER/Amiga/FDD
  
  sudo mkdir /boot/Amiga
  sudo cp -R /home/$USER/amiberry/kickstarts /boot/Amiga
  cd cd ~/Amiga
  wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
  unzip ./ClassicWB_UAE_v28.zip
  
  
  mv /home/$USER/amiberry/ClassicWB_UAE_v28 /home/$USER/Amiga/HDD
 
  wget https://netcologne.dl.sourceforge.net/project/aros/nightly2/20210114/Binaries/AROS-20210114-raspi-armhf-system.tar.bz2
  #unzip ./AROS-20210114-raspi-armhf-system.tar.bz2
  
#Install PiKISS
cd ~
git clone --depth=1 https://github.com/jmcerrejon/PiKISS

cd PiKISS
sudo chmod -R 777 ./piKiss.sh
sudo ./piKiss.sh 
sudo ./piKiss.sh  

  
sudo apt-get autoremove
whiptail --msgbox " Ready,... Okey, here we are ...Lets Pimiga3000 :-)" 20 60 1

startx

