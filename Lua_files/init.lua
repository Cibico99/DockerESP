function sendIP(T) -- connect to server and send ESP IP, beacuse DHCP is better than static


  http.post('http://'..serverIP..':8266/nodes.php',nil,
    '{"MAC":"'..wifi.sta.getmac()..'","IP":"'..T.IP..'"}',
    function(code,data)
      if(code<0) then
        print("HTTP request failed")
      else
       print("MAC: "..wifi.sta.getmac().." - IP: "..T.IP)
       print(code, data)
      end
    end)

end


uart.setup(0,9600,8,0,1) -- set baud to 9600
wifi.setmode(wifi.STATION)

file.open("params.txt",r) -- get parameters
serverIP = string.sub(file.readline(),0,-2)
local SSID = string.sub(file.readline(),0,-2)
local Password = string.sub(file.readline(),0,-2)

print("serverIP: " .. serverIP .. " SSID: " ..  SSID .. " Passwrd: " .. Password)
wifi.sta.config(SSID,Password)
print("System Info:  ")

wifi.eventmon.register(wifi.eventmon.STA_GOT_IP,sendIP)

majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
 -- get file system info
remaining, used, total=file.fsinfo()
print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes")
print("\nReady")
dofile("servernode.lua")
