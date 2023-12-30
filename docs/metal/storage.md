# Storage

# Setup a blank SSD for use a data drive

## Install parted

```
sudo apt update
sudo apt install parted
```

## Find the new disk

```
sudo parted -l
```

or

```
lsblk -o +VENDOR,MODEL
```

## Partition

```
sudo parted /dev/sda mklabel gpt

sudo parted /dev/sda mkpart primary ext4 0% 100%

lsblk
```

## Create a filesystem on the partition

```
sudo mkfs.ext4 /dev/sda1
```

## Mount

Mounting is handled through ansible in [main.yaml](/metal/roles/metal/tasks/main.yaml). The main disk is mounted as `/data`

Get the `UUID` (and not the `PARTUUID`) of the drive and add it to [inventory.yaml](/metal/inventory.yaml) as `disk_src` like so:

```
sudo blkid

/dev/sda1: UUID="0492a4c9-c1d8-41d3-b06d-761a8529e13a" TYPE="ext4"
PARTLABEL="primary" PARTUUID="0bd371ec-05bc-420a-9043-7d32e1f01a98"
```

inventory.yaml

```
disk_src: UUID=0492a4c9-c1d8-41d3-b06d-761a8529e13a,
```

## References

- [DigitalOcean - How to partition and format storage in linux](https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux)
