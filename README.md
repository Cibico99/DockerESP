# DockerESP
Wireless ESP upload/management in a Docker w/ Roomba control!

Feel free to use this to manage any ESP, doesn't have to be strapped to a roomba!


## Quick Start
Things to change to make this work right away, if you already know what your doing, or just like get4ting lost like me =)
1. **rebuild.sh** - Change the path '/home/paul/docker/DockerESP/ESP' to wherever the ESP folder is on your system. This is for mounting this foulder in the container, allowing you to live modify the fiels in the folder without restarting the container, a very nice feature!
2. That's it! run ./rebuild.sh and the webpage should be available on the system at localhost:8266
 * Errors/Warnings: rebuild.sh will throw 2 errors right at the beggining on your first run, just saying that the container doesn't exist when it tries to stop and remove it.
  * Another warning from apache will be thrown saying **ServerName** cannot be determined. This is defined in docker_files/ESP.conf(well not defined, but commented out). This is okay it just lets you know that apache could not determine the web address of the system, which for most is not a desiered feature.


## Setup

### ESP
The ESP8266 needs to have the NodeMCU firmware flashed on to it (cause what else would you want)

##### Flashing 
http://www.benlo.com/esp8266/esp8266QuickStart.html

###### Firmware
https://github.com/nodemcu/nodemcu-firmware/releases

###### Files
To manage the ESP over WIFI we need to load some well crafted Lua files, thanks to breagan22, which I have made a few modification to to make the Romba happy. Mostly just removing prints that anger the roomba.

Files located in Lua_files, places these onto the ESP.
After this you will be able to upload files wirelessly!

###### Credit
breagan22 over at instrucables - http://www.instructables.com/id/ESP8266-WiFi-File-Management/?ALLSTEPS

###### Github
https://github.com/breagan/ESP8266_WiFi_File_Manager


## Docker
Just need docker engine running on your system, additional files meant for linux.

### Building
#### linux: 
1. ./rebuild.sh
 * This will stop, remove, build, and start the container
 * **Note**: You must edit the path after -v in rebuild.sh to reflect your location of the ESP folder in this repo. From **-v** to **:**
2. ./exec.sh
 * This will execute the command to place you in the container itself, in a bash environment.

