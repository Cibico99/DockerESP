function sendIP(ip,serverIP) -- connect to server and send ESP IP, beacuse DHCP is better than static

  http.put(serverIP, nil, ip, function(code,data)
    if(code<0) then
      print("http put failed")
    else
      print("Good")
      print(code,data)
    end
  end)
	--conn = net.createConnection(net.TCP,0)
	--conn:on("connection", function(conn, payload)
	--	conn:send('/nodes.php?nodeIP='..nodeIP)
		--local data = {"nodeIP":nodeIP}
		--conn:send(cjson.encode(data))
	--	end)

	--conn:connect(8266,serverIP)
end



wifi.setmode(wifi.STATION)

file.open("params.txt",r) -- get parameters
local serverIP = string.sub(file.readline(),0,-2)
local SSID = string.sub(file.readline(),0,-2)
local Password = string.sub(file.readline(),0,-2)

print("serverIP: " .. serverIP .. " SSID: " ..  SSID .. " Passwrd: " .. Password)
wifi.sta.config(SSID,Password)
print("System Info:  ")
print("IP: ")

tmr.alarm(1,1000,1, function() if wifi.sta.getip()==nil then print("Waiting for IP") else print("IP: " .. wifi.sta.getip())  local nodeIP, nm, gw = wifi.sta.getip() sendIP(nodeIP,serverIP) tmr.stop(1) end end)


print(nodeIP)
--sendIP(nodeIP,serverIP)
majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
 -- get file system info
remaining, used, total=file.fsinfo()
print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes")
print("\nReady")
dofile("servernode.lua")

	
