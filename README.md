# KickPi-OS



KickPi-OS is aimed at Amiga friends who want to revive the Amiga experience on a Raspberry Pi.



Compatible to:


- Raspberry Pi OS 32 bit (recommended)
- Raspberry Pi OS 64 bit (limited,no Retropie,..)
- Amibian                (unofficial)

Software among others:
XFCE4, Amiberry, PiKiss, Retropie ...

It is a side project of my Amiga 3000 mini to print yourself. But I think it's also interesting for other Amiga friends.

# Disclaimer

The whole thing here is a hobby project. Use at your own risk ;-)
I'm far from being good at scripting ;-) It works.

But: if someone has suggestions for improvement, constructive criticism or whatever - bring them on. 
A warm welcome

Greetings Bernd
bernd.titze@me.com

# Supported hardware:

Since it is based on a Raspberry Pi OS, it should work on all Raspberry Pi's.

Please note that the 64 bit version also works, but not all functions are available here.

# Preparation:

Install Raspberry Pi OS using Raspberry Pi Imager
https://www.raspberrypi.org/software/

Optional:
- Format a USB stick
- Call him AMIGA
- Copy the "Shared" files from the AmigaForever installation
-> "AMIGA/Shared/Copy here are your AmigaForever files"

# Installation:
On the raspberry you open a terminal window and type following commands:

git clone --depth=1 https://github.com/Jodels2002/KickPi-OS.git

sudo chmod -R 777 KickPi-OS

cd KickPi-OS

./setup.sh

# Update

To bring KickPi-OS up to date, just type "m" + return in the cammand line. Then use the point "u Update KickPi-OS"

# Retropie:
To use Retropie just copy your Bios and Rom files into the (Home) Retropie folder. 
See also: https://retropie.org.uk/docs/First-Installation/


# Used 3rd party tools:


Amiberry:
https://github.com/midwan/amiberry

RetroPie
https://github.com/RetroPie

PiKiss
https://github.com/jmcerrejon/PiKISS


Source of Game:

https://amigaland.de/1318-2

All games are subject to the copyrights of the respective manufacturer, Amigaland.de has a license for all games offered here, which allows these Amiga games to be offered for free download. These games are for private use only and may not be used commercially! 
