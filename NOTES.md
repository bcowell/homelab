# Brayden's Homelab

[Images]
[image description]

- 2x [ROCK64 - 4GB](https://pine64.com/product/rock64-4gb-single-board-computer/)
  - 2x [ROCK64 PoE hats](https://pine64.com/product/rock64-quartz64-model-b-poe-add-on-board/)
- 1x Raspberry Pi 4B - 4GB
  - [UCTRONICS PoE hat](https://www.uctronics.com/tools-and-accessories/pi-accessories/uctronics-poe-hat-ieee-5v-2-5a-mini-power-over-ethernet-expansion-board.html)
- 3x [Silicon Power SSDs - 1TB & 512GB](https://a.co/d/hlKWpGv)
- [TP-Link 5 Port Gigabit PoE Switch - TL-SG1005P](https://a.co/d/33y9pDA)
- [C4Labs Cloudlet Cluster Case](https://www.c4labs.com/product/cloudlet-cluster-case-raspberry-pi/)

Preface with I have no idea what I'm doing

Good luck finding a raspberry pi. You can try rpilocator, but for the price; ROCK64 or alternative boards are hands-down the way to go.
And that is assuming you want this thing for the novelty like I do. It would likely be a lot smarter to just get some mini assembled PCs.

<Add case issues and pains here>

You may want to check the power draw if you use all four PoE ports of the switch with a board and SSD. 56W for my three ports hasn't exploded yet

<Thank Khuedan>

How my project differs high-level and link to architecture
In the future maybe I'll comeback and see if I can get PXE booting to work, but not sure I see the value given how fun it is to setup the OS and SSDs by hand.

# Setup

Install [Terraform](https://developer.hashicorp.com/terraform/downloads), [Packer](https://developer.hashicorp.com/packer/downloads) and Ansible

Would recommend to use brew over python to install
`brew install ansible`

Generate an ssh-key with `./scripts/ssh-keygen.sh`

# Rough Notes

https://www.reddit.com/r/homelab/wiki/introduction/
https://github.com/mikeroyal/Self-Hosting-Guide

## Look into

- Terraform
- Ansible
- rke https://registry.terraform.io/providers/rancher/rke/latest
- traefik
- portainer

- tailscale
- Cloud flare tunnel
- Wireguard
- Openvpn

- Apache Guacamole
- Qbittorrent
- Speedflux

## apps

- Secret management
  - Vaultwarden
- Storage
  - Nextcloud https://nextcloud.com/
  - myDrive https://github.com/subnub/myDrive
- Media server
  - jellyfin, emby
- Media server management
  - sonarr - manage & download TV shows
  - radarr - manage & download movies
  - overseerr/Ombi - request content for media server
  - Prowlarr
  - requestrr
  - tautulli - monitor plex
- Monitoring
  - grafana
  - prometheus
  - healthchecks.io / Uptime kuma

## system

## infra

## To Install

- K3s
- Pihole https://github.com/pi-hole/pi-hole

## Ideas

- Dashboard
- Media vault
- Display my apple to do list
- Scrape events from city website, filters for low - capacity, time, type
- CI/CD
  Homepage with Ingress discovery powered by [Hajimari](https://github.com/toboshii/hajimari)
