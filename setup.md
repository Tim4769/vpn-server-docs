# Setup Notes

## VPS

Provider: AWS Lightsail  
OS: Ubuntu 24.04 LTS  
Region: Singapore  

I picked AWS Lightsail because it is simple like a normal VPS. I picked Singapore because it was easy to set up and should be stable enough.

## Basic commands

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl jq nano openssl ca-certificates
```

## Main components

- Xray installed on the server
- VLESS + REALITY configured
- Client imported into Shadowrocket / Hiddify
- Server tested with browser, YouTube, and normal apps
- Marzban used later to manage users and subscription links
- Marzban Node used on extra VPS nodes

## Basic setup notes

I made a folder to keep setup values together:

```bash
mkdir -p ~/xray-setup
cd ~/xray-setup
```

The Xray config used port `443` so it looks more like normal HTTPS traffic.

For REALITY, the client SNI needs to match the server setting. One problem I had was that text apps worked but bigger apps or uploads were broken. Adding the right server name in the client fixed it.

## Marzban notes

At first I looked at 3x-ui, but it was more for managing VPN nodes on one VPS. I wanted something that could manage users and subscription links better, so I used Marzban.

My setup became:

- one Marzban panel server
- AWS node
- Bandwagon node
- subscription link imported into Shadowrocket

I also tried post quantum VLESS encryption with `xray vlessenc`. It needed a newer Xray version. Some nodes failed when they were still using old Xray, so I had to point Marzban and nodes to the newer Xray binary.

## Swap memory fix

One time the AWS Xray crashed because the VPS did not have enough memory. I added 1 GB swap:

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

