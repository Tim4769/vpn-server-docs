# VPN Server Project

This repository documents my Linux based VPN/proxy server setup.

I made this mainly to keep track of what I did on the server. It is not a full tutorial, but it shows the main setup, security changes, and problems I fixed.

## Project Goal

Set up and manage a VPS based VPN/proxy server using Xray, VLESS, REALITY, and client apps like Shadowrocket or Hiddify.

## Stack

- VPS: AWS Lightsail / Linux VPS
- OS: Ubuntu 24.04 LTS
- Region: Singapore
- Proxy core: Xray
- Protocol: VLESS + REALITY
- Client: Shadowrocket / Hiddify
- Management: Marzban / Marzban Node

## Server Layout

- RackNerd VPS: Marzban panel server
- AWS Lightsail VPS: Marzban node for VPN traffic
- Bandwagon VPS: Marzban node for VPN traffic

The RackNerd VPS is mainly the control panel. The AWS and Bandwagon VPSs are the nodes that actually run the proxy traffic.

## Files

- `setup.md` - installation and setup notes
- `security.md` - SSH, firewall, and privacy settings
- `troubleshooting.md` - problems and fixes
- `configs/` - example configs with secrets removed
- `scripts/` - useful Linux check scripts
- `journal/` - cleaned notes from my Notion journal, split by date

## Screenshots

Some screenshots are in `journal/images/`. I only kept simple ones that do not show real server secrets.
