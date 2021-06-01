# This file is executed on every boot (including wake-boot from deepsleep)
import esp
#esp.osdebug(None)
import uos, machine
#uos.dupterm(None, 1) # disable REPL on UART(0)
import network
import ubinascii
print(ubinascii.hexlify(network.WLAN().config('mac'),":").decode())
print(esp.flash_id())
import gc
#import webrepl
#webrepl.start()
gc.collect()

