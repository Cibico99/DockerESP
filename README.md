# DockerESP
Wireless ESP upload/management in a Docker w/ Roomba control!

Feel free to use this to manage any ESP, doesn't have to be strapped to a roomba!

## Warning!!!
Currently no security implemented!

## Quick Start
Things to change to make this work right away, if you already know what your doing, or just like getting lost like me =)

1. **rebuild.sh** - Change the path '/home/paul/docker/DockerESP/ESP' to wherever the ESP folder is on your system. This is for mounting this folder in the container, allowing you to live modify the files in the folder without restarting the container, a very nice feature!

2. **Lua_files/params.txt** 
 * You must create this file, Example_params.txt can be modified and renamed
 1. Line 1: ServerIP : The ip that the ESP should connect to, which is your docker system
 2. Line 2: SSID : The name of your wireless SSID(name)
 3. Line 3: Password: The password for your network, **followed by a new line**
 4. Line 4: A blank line because the line before this one ends in a new line!

3. That's it! run ./rebuild.sh and the webpage should be available on the system at *serverIP*:8266
 * Errors/Warnings: rebuild.sh will throw 2 errors right at the beginning on your first run, just saying that the container doesn't exist when it tries to stop and remove it.
  * Another warning from apache will be thrown saying **ServerName** cannot be determined. This is defined in docker_files/ESP.conf(well not defined, but commented out). This is okay it just lets you know that apache could not determine the web address of the system, which for most is not a desired feature.


## Setup

#### Requirements

 * Linux:
  * pyserial : https://github.com/pyserial/pyserial - serial communication with python
  * esptool  : https://github.com/themadinventor/esptool - for flashing firmware
    * Ex: sudo python esptool.py --port /dev/ttyUSB0 write_flash 0x00000 ~/Downloads/nodemcu-master-12-modules-2016-06-17-19-34-29-integer.bin 
 
  * luatool  : https://github.com/4refr0nt/luatool       - for writeing files to ESP for first time (cable)
    * Ex: luatool.py --port /dev/ttyUSB0 --src ~/ESP/init.lua --dest init.lua --verbose

  * miniterm : https://github.com/pyserial/pyserial/blob/master/serial/tools/miniterm.py - for easy ESP serial communication 
    * Ex: sudo miniterm.py /dev/ttyUSB0 115200


### ESP
The ESP8266 needs to have the NodeMCU firmware flashed on to it (cause what else would you want)

##### Flashing 
http://www.benlo.com/esp8266/esp8266QuickStart.html

Set GPIO0 to GND to flash, restart ESP and imidiatly start the flashing process

 * Linux: sudo python esptool.py --port /dev/ttyUSB0  write_flash 0x00000 The_Path_To_The_NodeMCU_Firmware.bin
  * http://www.whatimade.today/flashing-the-nodemcu-firmware-on-the-esp8266-linux-guide/
  * Required tool:
   * esptool : https://github.com/themadinventor/esptool - for flashing firmware

##### Firmware
https://github.com/nodemcu/nodemcu-firmware/releases

 * The firmware I am running is in the firmware folder, should be sufficent to start you off.

##### Files
To manage the ESP over WIFI we need to load some well crafted Lua files, thanks to breagan22, which I have made a few modification to to make the Roomba happy. Mostly just removing prints that anger the roomba.

Files located in Lua_files, places these onto the ESP.
After this you will be able to upload files wirelessly!

* Command: luatool.py --port /dev/ttyUSB0 --src ~/ESP/init.lua --dest init.lua --verbose

   * luatool : https://github.com/4refr0nt/luatool       - for writeing files to ESP for first time (cable)


1. init.lua: This file is run at startup of the ESP, which initilizes the ESP, connects it to the network, and **reports its ip to the server**
 * Change the "SSID","Password" pair in this file to your SSID and Password so the ESP can connect to your network.

##### Credit
breagan22 over at instructables - http://www.instructables.com/id/ESP8266-WiFi-File-Management/?ALLSTEPS

##### Github
https://github.com/breagan/ESP8266_WiFi_File_Manager


## Docker
Just need docker engine running on your system, additional files meant for linux.

### Building
#### Linux: 
1. ./rebuild.sh
 * This will stop, remove, build, and start the container
 * **Note**: You must edit the path after -v in rebuild.sh to reflect your location of the ESP folder in this repo. From **-v** to **:**
2. ./exec.sh
 * This will execute the command to place you in the container itself, in a bash environment.

