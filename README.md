# VPN Server Project

This repository documents my Linux based VPN/proxy server setup.

I made this mainly to keep track of what I did on the server. It is not a full tutorial, but it shows the main setup, security changes, and problems I fixed.

## Project Goal

Set up and manage a VPS based VPN/proxy server using Xray, VLESS, REALITY, and client apps like Shadowrocket or Hiddify.

## Stack

- Panel VPS: RackNerd
- Node VPSs: AWS Lightsail and BandwagonHost
- AWS node OS: Ubuntu 24.04 LTS
- Bandwagon node OS: Ubuntu 26.04 x86_64
- Main AWS region: Singapore
- Bandwagon location: US, California
- Proxy core: Xray
- Protocol: VLESS + REALITY
- Client: Shadowrocket / Hiddify
- Management: Marzban / Marzban Node

## Server Layout

- RackNerd VPS: Marzban panel server
- AWS Lightsail VPS: Marzban node for VPN traffic
- Bandwagon VPS: Marzban node for VPN traffic

The RackNerd VPS is mainly the control panel. The AWS and Bandwagon VPSs are the nodes that actually run the proxy traffic.

## Node Details

I kept the real public IPs, VM IDs, and hostnames out of this public README.

The AWS and Bandwagon nodes use the same server idea: Marzban Node, Xray, VLESS, REALITY, SSH on `22`, and proxy traffic on `443`.

| Detail | AWS Lightsail Node | Bandwagon Node |
| --- | --- | --- |
| Main role | Marzban node | Marzban node |
| Provider | AWS Lightsail | BandwagonHost / KiwiVM |
| Plan / bundle | Lightsail VPS plan, not posted in public notes | KVMV5-20G-1G-1T-CA-CN2GIA |
| Location | Singapore | US, California |
| Server type | Linux VPS node | KVM VPS node |
| Operating system | Ubuntu 24.04 LTS | Ubuntu 26.04 x86_64 |
| SSH port | 22 | 22 |
| VPN/proxy port | 443 | 443 |
| Proxy setup | Xray, VLESS, REALITY | Xray, VLESS, REALITY |
| Management | Connected to RackNerd Marzban panel | Connected to RackNerd Marzban panel |
| Memory notes | small VPS, added swap when memory was low | 1 GB RAM, about 545 MB swap |
| Disk notes | not posted in public notes | 20 GB disk |
| Bandwidth notes | not posted in public notes | 1 TB monthly bandwidth |
| Public server info | redacted in public repo | redacted in public repo |

## Current Xray Config

The example config in `configs/xray-config.example.json` matches my current setup shape, but the key fields are still redacted.

- inbound tag: `VLESS TCP REALITY`
- port: `443`
- REALITY destination/SNI: `www.cloudflare.com`
- clients list: empty in this public example
- sniffing: disabled
- routing: private IP ranges go to `BLOCK`
- outbounds: `DIRECT` for normal traffic and `BLOCK` for blocked traffic
- logs: access, error, and loglevel are all set to `none`

## Files

- `setup.md` - installation and setup notes
- `security.md` - SSH, firewall, and privacy settings
- `troubleshooting.md` - problems and fixes
- `configs/` - example configs with secrets removed
- `scripts/` - useful Linux check scripts
- `journal/` - cleaned notes from my Notion journal, split by date

## Screenshots

Some screenshots are in `journal/images/`. I only kept simple ones that do not show real server secrets.
