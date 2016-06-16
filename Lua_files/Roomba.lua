--setup baudrate
uart.setup(0,57600,8,uart.PARITY_NONE,uart.STOPBITS_1,0)


-- send commands
uart.write(0,128) --start

tmr.delay(1000)

--uart.write(0,132) -- full mode
uart.write(0,132,139,2,100,100) -- led colors


tmr.delay(1000)

uart.write(0,132,141,1)


--uart.wrte(0,145,0,100,0,100)-- direct drive, not working

--uart.write(0,132) -- full mode
--uart.write(0,145) -- drive forward
--uart.write(0,0) -- right wheel high byte
--uart.write(0,100) -- right wheel low byte
--uart.write(0,0) -- left high
--uart.write(0,100) -- left low

tmr.delay(1000)


--uart.write(0,145) -- stop
--uart.write(0,0)
--uart.write(0,0)
--uart.write(0,0)
--uart.write(0,0)

