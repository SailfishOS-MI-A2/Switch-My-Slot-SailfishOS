import pyotherside
import os

stream = os.popen('/bin/bootctl hal-info')
output = stream.read()
pyotherside.send('halVersion', output)

stream = os.popen('/bin/bootctl get-number-slots')
output = stream.read()
pyotherside.send('noOfSlots', output)

stream = os.popen('/bin/bootctl get-current-slot')
output = stream.read()
temp = output

if temp.__eq__(0):
    pyotherside.send('currentSlot', "A")
elif s1.__eq__(1):
    pyotherside.send('currentSlot', "B")

stream = os.popen('/bin/bootctl get-suffix ' + temp)
output = stream.read()
pyotherside.send('currentSlotSuffix', output)

def switchSlotFunc():
    if temp.__eq__(0):
        os.system("/bin/bootctl set-active-boot-slot " + "1")
    elif temp.__eq__(1):
        os.system("/bin/bootctl set-active-boot-slot " + "0")
