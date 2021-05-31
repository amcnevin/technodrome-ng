
####
# port to attached device
PORT=/dev/ttyUSB0

# baudrate
BAUD=$(shell stty < ${PORT} speed)

# path to the MicroPython firmware bin
FIRMWARE=${MP_FW} 
####

erase_device:
	esptool.py -p ${PORT} -b ${BAUD} erase_flash

write_fw:
	esptool.py -p ${PORT} -b ${BAUD} write_flash --flash_size=detect 0 ${FIRMWARE}

reset_device: erase_device write_fw


repl:
	screen ${PORT} ${BAUD}

ls:
	ampy -p ${PORT} ls

write_blink:
	ampy -p ${PORT} put ./devices/blink_test/boot.py 
	ampy -p ${PORT} put ./devices/blink_test/main.py
