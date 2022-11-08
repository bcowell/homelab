# Find hardware IPs

You may be able to find the ip with arp
`arp -an`

If not you can try nmap, which includes a bit more detail for each IP/MAC address

`brew install nmap`

`sudo nmap -sn 10.0.0.1/24`
