# ROCK64

`ansible-playbook metal.yml`

## Setup

### Download OS

[Download the OS image (debian stretch minimal arm64)](https://github.com/ayufan-rock64/linux-build/releases/download/0.9.14/stretch-minimal-rock64-0.9.14-1159-arm64.img.xz)

```bash
curl -L "https://github.com/ayufan-rock64/linux-build/releases/download/0.9.14/stretch-minimal-rock64-0.9.14-1159-arm64.img.xz"
```

### Burn

Burn the OS to a microSd or USB thumbdrive

On OSX I did:

```
diskutil list
diskutil unmountDisk /dev/<sdcard>
xz -k -d -c -v -T 3 <IMG>.img.xz | sudo dd of=/dev/<sdcard> bs=1m
```

### Boot

Once that's burned, put the microSD into the ROCK64 and boot it with ethernet attached.

Grab the ip. I just grabbed it from my router's admin portal, which shows all devices connected.
You can also reserve the IP address to the MAC address at this point if you wish.

Like the pi you are required to change your password immediately (root enforced).
For some reason ansible see the machine state as unreachable at this point, which is very annoying.
You must run the change_expired_pass task for each machine.

Once that's ran and changed the default password to the one set in variables. Verify with `ansible rock64 -m ping`

---

## Provision

`ansible-playbook metal.yaml`

Ansible uses sshpass when logging in to a server via SSH using a password. Apparently, Apple removed sshpass and merged its functionality into the ssh, scp, and ssh-add commands.

### Install sshpass on OSX

For security reasons, you should have Ansible logging in to servers using SSH keys, but for new servers it is simpler to initially log in with a password, have Ansible setup your users and SSH keys, then have subsequent logins use SSH keys.

To get past the sshpass error, you can install sshpass from source code with the following steps:

Install Xcode from the App Store.

Once Xcode is installed, download and install the Command Line Tools by opening Xcode > opening Xcode’s Preferences > clicking the Downloads tab > clicking Command Line Tools > and finally clicking the Install button.

Once the Command Line Tools are installed, download and un-tar the sshpass source code:

cd ~/Downloads

curl -O -L http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz

tar xvzf sshpass-1.05.tar.gz

cd sshpass-1.05
Configure, make, and install the sshpass binary:

./configure

make

sudo make install

The default password is rock64, which you'll be prompted to change on first sign in.

### Setup

ssh-copy-id

- ssh in `ssh rock64@<ip>`
- change default password

```
mkpasswd --method=SHA-512
TYPE THE PASSWORD 'secret01'
```

change the host name
` sudo nano /etc/hostname`

- remove root access?
- create a new user?

Login to your router and reserve the IP address by associating the MAC address to an IP address.

### Verify SSH

Test the SSH connection with ansible
`ansible all -m ping`

# Acknowledgements

- https://wiki.pine64.org/wiki/ROCK64_Software_Releases#Debian_by_ayufan
- https://github.com/ayufan-rock64/linux-build/blob/master/recipes/flash-spi.md
- https://files.pine64.org/doc/rock64/ROCK64_V3_Pi-2_and_Pi-P5+_Bus.pdf
