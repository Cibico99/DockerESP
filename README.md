# DockerESP
Wireless ESP upload/managment in a Docker w/ Roomba control!

Feel free to use this to manage any ESP, doesn't have to be strapped to a roomba!

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
On linux: ./rebuild.sh
 * This will stop, remove, build, and start the container
 * **Note**: You must edit the path after -v in rebuild.sh to reflect your location of the ESP folder in this repo. From **-v** to **:**

