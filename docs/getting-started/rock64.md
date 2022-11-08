## ROCK64

https://wiki.pine64.org/wiki/ROCK64_Software_Releases#Debian_Stretch_Minimal_64bit_(arm64)_OS_Image_[microSD_/_eMMC_Boot]_[0.8.3]
(How to flash bootloader)[https://github.com/ayufan-rock64/linux-build/blob/master/recipes/flash-spi.md]
(Pin labels)[https://files.pine64.org/doc/rock64/ROCK64_V3_Pi-2_and_Pi-P5+_Bus.pdf]

### Setup

Download the OS image (debian stretch minimal arm64)[https://github.com/ayufan-rock64/linux-build/releases/download/0.9.14/stretch-minimal-rock64-0.9.14-1159-arm64.img.xz]

Burn this to a microSd or USB thumbdrive
On OSX I did:
`diskutil list`
`diskutil unmountDisk /dev/<sdcard>`
`sudu su`
`xz -k -d -c -v -T 3 <IMG>.img.xz | dd of=/dev/<sdcard> bs=1m`

Once that's burned, put the microSD into the ROCK64 and boot it with ethernet

Grab the ip. I just grabbed it from my router's admin portal, which shows all devices connected
ssh rock64@10.0.0.103

default password is rock64, which you'll be prompted to change on first sign in.
