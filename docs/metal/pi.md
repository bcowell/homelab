## Raspberry Pi

## Setup

### 1. Download the [OS image](https://www.raspberrypi.com/software/operating-systems/) (Raspberry Pi OS Lite - debian arm64)

```sh
curl -L "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz"
```

### 2. Burn the OS to a microSD

On OSX I did:

```sh
diskutil list
diskutil unmountDisk /dev/<sdcard>
xz -k -d -c -v -T 3 <IMG>.img.xz | sudo dd of=/dev/<sdcard> bs=1m
```

You could also use [Etcher](https://etcher.balena.io/)

### 3. Find the IP and MAC address

Once the OS is burned, put the microSD into the Pi and boot it with ethernet attached.

Grab the ip. I just grabbed it from my router's admin portal, which shows all devices connected.

You can also try

```sh
arp -a
```

You could reserve the IP address to the MAC address at this point if you wish.

### 4. Change root password

You are required to change your password immediately (root enforced).
For some reason ansible sees the machine state as unreachable at this point, which is very annoying.

You could do this manually or run the `change_expired_pass` task for each machine, which will ssh in with the
default root password and update it to the value in `group_vars`.

```sh
ansible-playbook change_expired_pass.yaml
```

Once that's ran and changed the default password to the one set in variables.
Test the SSH connection with

```sh
ansible pi -m ping
```

`ansible-playbook metal.yaml`

---

## Notes

The default password is raspberry, which we'll change via the change_expired_pass playbook.

### Setup Checklist

- ssh in `ssh pi@<ip>` with default password
- change default password
- Add our ssh public key so we can use that to ssh going forward
- Partition, format and setup SSD

Remember to reserve the IP address for each MAC.
