# How to run the Idris apps

## QEMU
Currently only the versatiblepb platform supports QEMU.
For versatilepb there is a qemu.* target generated for all binaries.
```
ninja qemu.hello-world
```

## BeagleBone Black (BBBB) hardware
Copy the binary (*.bin) in the images folder to the root of a FAT32 formatted SD card and insert it in the BBB.

### Boot by interrupting U-boot using an FTDI serial cable
Turn off hardware flow control (sudo minicom -s; Serial port setup -> Hardware Flow Control)

1. Connect the J1 on the BBB to the black cable on the FTDI connector
2. Connect the USB side of the FTDI cable to the dev machine
4. Run, minicom -D /dev/ttyUSB0 -b 115200
5. Connect the power cable to the BBB
6. Interrupt the boot process by pressing ENTER quickly a few times
7. Run the following in the U-boot prompt
```
=> setenv bin hello-world.bin ; setenv loadaddr 0x80000000 ; fatload mmc 0 ${loadaddr} ${bin} ; go ${loadaddr}
```
