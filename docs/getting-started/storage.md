## Storage

### Setup SSD

https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux

`sudo cp -avx / /mnt/data`
`sudo nano /boot/efi/extlinux/extlinux.conf`
changing the label to your SSD
`sudo reboot`
`sudo lsblk -f`

`sudo umount /dev/sda1`
