# Brayden's Homelab

[Images]
[image description]

# Setup

MAC address for each machine
OS disk name (for example /dev/sda)
Network interface name (for example eth0)
Choose a static IP address for each machine (just the desired address, we don't set anything up yet)

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
