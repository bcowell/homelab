# Storage

# Setup SSD

Originally tried to setup the new SSDs manually, but after trying dd to clone I ended up using etcher image cloner.
It took under 1 minute to clone a 256GB microSD -> 512GB SSD
[balenaEtcher](https://www.balena.io/etcher/)

Had I just setup the OS on packer and then flashed with etcher from the get-go, I would have saved a lot of time.

If you want to try everything manually.
The full set of instructions can be found here https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux

## Install parted

```
sudo apt update
sudo apt install parted
```

## Find the new disk

```
parted -l
```

or

```
lsblk -o +VENDOR,MODEL
```

## Partition

```
sudo parted /dev/sda mklabel <DRIVE_LABEL>

sudo parted -a opt /dev/sda mkpart primary ext4 0% 100%

lsblk
```

## Create a filesystem on the partition

```
sudo mkfs.ext4 -L <DATA_LABEL> /dev/sda1

```

## Mount

```
sudo mkdir -p /mnt/data
sudo mount -o defaults /dev/sda1 /mnt/data
sudo nano /etc/fstab
```

Add `LABEL=<DATA_LABEL> /mnt/data ext4 defaults 0 2`

## Copy

```
dd if=/dev/sda of=/dev/sdb bs=64K conv=noerror,sync status=progress
```

or

`sudo cp -avx / /mnt/data`
`sudo nano /boot/efi/extlinux/extlinux.conf`
changing the label to your SSD
`sudo reboot`
`sudo lsblk -f`

`sudo umount /dev/sda1`

## Boot from SSD
