#!/bin/bash
#***********************************************  #KickPi-OS Retropie content loader  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
# not ready....
if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      else 
      echo " "
      
      fi
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  ClassicWB_OS39_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
      else 
      clear
      fi

      
if [ ! -d /home/$USER/RetroPie/roms/Amiga_WHD_Games ]; then
      clear
      toilet -F gay Retropie
      echo " "
      echo " "
      echo "  Configure Retropie Romset from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      #wget https://archive.org/compress/Amiga_WHD_Games
      #unzip -u /home/$USER/RetroPie/roms/Amiga_WHD_Games
      
      else 
      clear
      
      fi
CommanderPi  Is out...User interaktiviti needed... 
      cd
      sudo apt install -y python-pil python3-pil python3-pil.imagetk-dbg python-pil-doc 
      git clone --depth=1 https://github.com/Jack477/CommanderPi
      clear
      toilet "KickPi-OS" --metal             full
      
      cd CommanderPi
      ./install.sh
      
     
      
     Is out...takes too long time... 
     if [ ! -d /home/pi/winetricks ]; then
        clear
       toilet "KickPi-OS" --metal
        toilet -F gay full
        echo " Wine" 
        cd 
        sudo apt -y install  playonlinux
       wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
      	 chmod +x winetricks
      	 sh winetricks corefonts vcrun6 
       else 
       clear
      
       fi
