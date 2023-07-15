# ROCK64

## Setup

1. Download the OS image (debian stretch minimal arm64)

```sh
curl -L "https://github.com/ayufan-rock64/linux-build/releases/download/0.9.14/stretch-minimal-rock64-0.9.14-1159-arm64.img.xz"
```

2. Burn the OS to a microSD

On OSX I did:

```sh
diskutil list
diskutil unmountDisk /dev/<sdcard>
xz -k -d -c -v -T 3 <IMG>.img.xz | sudo dd of=/dev/<sdcard> bs=1m
```

I attempted to boot from SSD using by flashing the SPI to no avail. If you want to try:

- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/flash-spi.md

3. Find the IP and MAC address

Once the OS is burned, put the microSD into the ROCK64 and boot it with ethernet attached.

Grab the ip. I just grabbed it from my router's admin portal, which shows all devices connected.

You can also try

```sh
arp -a
```

You could reserve the IP address to the MAC address at this point if you wish.

4. Change root password

Like the pi you are required to change your password immediately (root enforced).
For some reason ansible sees the machine state as unreachable at this point, which is very annoying.

You could do this manually or run the `change_expired_pass` task for each machine, which will ssh in with the
default root password and update it to the value in `group_vars`.

```sh
ansible-playbook change_expired_pass.yaml
```

Once that's ran and changed the default password to the one set in variables.
Test the SSH connection with

```sh
ansible rock64 -m ping
```

`ansible-playbook metal.yml`

---

## Provision

### Install sshpass on OSX

For security reasons, you should have Ansible logging in to servers using SSH keys, but for new servers it is simpler to initially log in with a password, have Ansible setup your users and SSH keys, then have subsequent logins use SSH keys.

Ansible uses sshpass when logging in to a server via SSH using a password. Apparently, Apple removed sshpass and merged its functionality into the ssh, scp, and ssh-add commands.

To get past the sshpass error, you can install sshpass from source code with the following steps:

1. Install Xcode from the App Store.

Once Xcode is installed, download and install the Command Line Tools by opening Xcode > opening Xcode’s Preferences > clicking the Downloads tab > clicking Command Line Tools > and finally clicking the Install button.

Once the Command Line Tools are installed, download and un-tar the sshpass source code:

```
cd ~/Downloads

curl -O -L http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz

tar xvzf sshpass-1.05.tar.gz

cd sshpass-1.05
```

Configure, make, and install the sshpass binary:

```
./configure

make

sudo make install
```

The default password is rock64, which we'll change via the change_expired_pass playbook.

### Setup Checklist

- ssh in `ssh rock64@<ip>` with default password
- change default password
- Add our ssh public key so we can use that to ssh going forward
- Partition, format and setup SSD

Remember to reserve the IP address for each MAC.

# Acknowledgements

- https://wiki.pine64.org/wiki/ROCK64_Software_Releases#Debian_by_ayufan
- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/flash-spi.md
- https://files.pine64.org/doc/rock64/ROCK64_V3_Pi-2_and_Pi-P5+_Bus.pdf
- https://gist.github.com/netvoip/7375604e57bca37b3e4ed04b8f55820a
