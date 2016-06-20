--setup baudrate
uart.setup(0,57600,8,0,1)

-- send commands
uart.write(0,"128") --start
uart.write(0,"132") -- full mode
uart.write(0,"145") -- drive forward
uart.write(0,"0") -- right wheel high byte
uart.write(0,"100") -- right wheel low byte
uart.write(0,"0") -- left high
uart.write(0,"100") -- left low

tmr.delay(100000)


uart.write(0,"145") -- stop
uart.write(0,"0")
uart.write(0,"0")
uart.write(0,"0")
uart.write(0,"0")

