
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

logo="$(tput setaf 2)
8888888b.  d8b 888b     d888 d8b                   (tput setaf 1)      .d8888b.   .d8888b.   .d8888b.   .d8888b. (tput setaf 1) 
888   Y88b Y8P 8888b   d8888 Y8P                        d88P  Y88b d88P  Y88b d88P  Y88b d88P  Y88b (tput setaf 1)
888    888     88888b.d88888                                 .d88P 888    888 888    888 888    888 (tput setaf 1)
888   d88P 888 888Y88888P888 888  .d88b.   8888b. $(tput sgr0)          8888"  888    888 888    888 888    888 (tput setaf 1)
8888888P"  888 888 Y888P 888 888 d88P"88b     "88b $(tput sgr0)          "Y8b. 888    888 888    888 888    888 (tput setaf 1)
888        888 888  Y8P  888 888 888  888 .d888888 $(tput sgr0)     888    888 888    888 888    888 888    888 (tput setaf 1)
888        888 888   "   888 888 Y88b 888 888  888 $(tput sgr0)     Y88b  d88P Y88b  d88P Y88b  d88P Y88b  d88P (tput setaf 1)
888        888 888       888 888  "Y88888 "Y888888 $(tput sgr0)      "Y8888P"   "Y8888P"   "Y8888P"   "Y8888P"  (tput setaf 1)
                                      888                                                           
                                 Y8b d88P                                                           
                                  "Y88P"   
$(tput sgr0)"


# Script Menu ..... 

#if [ "$#" -eq 0 ] ; 
#then

  #echo -e "Please select 1 - 3:"
  #exit 1
#elif [ "$#" -gt 1 ] ;
#then

  #echo -e "Please select 1 - 3:"
  #exit 1
#else
  #numb=$1
  #case "$numb" in
    #1) echo "Install Basic Pimiga3000 ";;
    #2) echo "Install Pimiga3000, Retropie & more";;
    #3) echo "Install Pimiga3000, Retropie & OLED Display";;
    
    #*) echo -e "Wrong input. Please write a number between 1 and 3.";;
  #esac
#fi
#exit 2
#exit 0

echo " "
echo " "
echo " "

echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start a upgrade.... sit down and relaxe...!"
echo " "
echo "Backup Settings...."
sudo mkdir /home/amibian/.backup/
sudo mkdir /home/amibian/.backup/usr/
sudo chmod -R 777 /home/amibian/.backup/

sudo cp -R /home/amibian/.config/ /home/amibian/.backup/.config
sudo cp -R /home/amibian/.local/ /home/amibian/.backup/.local
sudo cp -R /usr/local/bin /home/amibian/.backup/usr

cd ~/Pimiga_mini

echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
# Todo create a clean Menu
unzip ~/Pimiga_mini/.data.pac
rm -r ~/.config/lxpanel ~/.config/lxsession ~/.config/lxterminal

mv /home/amibian/Pimiga_mini/.data/.config/lxpanel ~/.config/lxpanel
mv /home/amibian/Pimiga_mini/.data/.config/lxsession ~/.config/lxsession
mv /home/amibian/Pimiga_mini/.data/.config/lxterminal ~/.config/lxterminal



echo "Time to update:) "
sudo apt-get -y update 
sudo apt-get -y upgrade

#xfce Desktop
#echo "XfCE4 install possible.....# if if whished:) "
#sudo apt-get -y remove --auto-remove xserver-common*
#sudo apt-get -y sudo apt-get purge openbox lxde
#sudo apt install -y xserver-xorg xfce4 xfce4-goodies
#sudo apt install -y xorg lightdm
#sudo dpkg-reconfigure lightdm

#restore.....#  if needed:) "
#sudo cp -R  /home/amibian/.backup/ usr/local/bin
cd ~

#Some little Tweaks....
sudo apt-get -y install openbox-menu openbox-themes obconf obconf-qt obmenu 
sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
sudo apt-get install -y libraspberrypi-dev

#Some little Amiga stuff....
sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms

sudo chmod -R 777 /usr/local/bin/
sudo chmod -R 777 /usr/local/share/
cd /home/amibian/


#Install Retropie/Setup

sudo apt-get install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
sudo chmod -R 777 /home/amibian/RetroPie-Setup/
cd /home/amibian/RetroPie-Setup

sudo __nodialog=1 ./retropie_packages.sh setup basic_install
sudo __nodialog=1 ./retropie_packages.sh setup amiberry
sudo __nodialog=1 ./retropie_packages.sh setup vice
sudo __nodialog=1 ./retropie_packages.sh setup lr-vice
sudo __nodialog=1 ./retropie_packages.sh setup giana
sudo __nodialog=1 ./retropie_packages.sh setup eduke32

# Install Amiberry Raspberry Pi with SDL2 + DispmanX

cd ~
 
  #git clone https://github.com/midwan/amiberry
  #cd amiberry
  #make -j2 PLATFORM=rpi4
  #sudo chmod -R 777 /home/amibian/amiberry
  
#Install PiKISS
cd ~
git clone --depth=1 https://github.com/jmcerrejon/PiKISS

cd PiKISS
sudo chmod -R 777 ./piKiss.sh
# sudo ./piKiss.sh  Could start here but....
  
sudo apt-get autoremove
whiptail --msgbox " Ready,... Okey, here we are ...Lets Pimiga3000 :-)" 20 60 1
#Amibian permission 
permission
sudo reboot
