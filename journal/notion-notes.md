# Notion Notes

These are cleaned notes from my VPN project journal. I removed real links, server values, and configs.

## Jun 13

- Chose AWS Lightsail because it is simple and works like a normal VPS.
- Picked Singapore region because it was easier than Hong Kong setup.
- Used Ubuntu 24.04 LTS because it has lots of tutorials.
- Opened port `443` for the VPN traffic.
- Screenshot:

![AWS firewall ports](images/aws-firewall-ports.png)

- Made a setup folder:

```bash
mkdir -p ~/xray-setup
cd ~/xray-setup
```

- Installed Xray and used VLESS + REALITY.
- Imported the client config into Shadowrocket.
- Text apps worked first, but YouTube and uploads were not stable.
- Fix was adding the correct server name/SNI in the client config.

## Jun 14

- Tried VLESS encryption with `xray vlessenc`.
- Chose ML-KEM for post quantum encryption testing.
- It was interesting, but later it made the subscription setup harder.

## Jun 15

- Changed Xray logging so access logs are off.
- Kept error logs only for debugging.
- Screenshot:

![Xray log policy](images/xray-log-policy.png)

- Cleared old logs with `truncate`.
- Checked system journal with `journalctl`.
- AWS firewall was limited to SSH and `443`.
- Screenshot:

![AWS firewall IPv4](images/aws-firewall-ipv4.png)

- IPv6 was disabled because the VPN setup only needed IPv4.
- Found that testing while another VPN was connected can cause weird timeout problems.

## Jun 16

- Looked at 3x-ui first.
- Realized 3x-ui is mainly for managing VPN settings, not really for managing multiple VPS servers in the way I wanted.
- Started looking at Marzban instead because it can make subscription links and manage users.

## Jun 17

- Bought another VPS and used it as a Marzban node.
- Installed Marzban panel on another server.
- Changed protocol to VLESS because the default was Shadowsocks.
- Added a user and imported the subscription link into Shadowrocket.

## Jun 19

- Thought about using one server for panel and another for nodes.
- Decided not to make the panel server also a node, because it could use too much traffic and make the panel harder to access.
- Added AWS and Bandwagon as Marzban nodes.
- Tried post quantum encryption in Marzban.
- Problem was old Xray versions on nodes.
- Fix was setting:

```text
XRAY_EXECUTABLE_PATH="/var/lib/marzban/xray-core/xray"
```

and mounting:

```text
- /var/lib/marzban:/var/lib/marzban
```

## Jun 20

- Removed the extra encryption test because it made subscription links harder to use.
- Changed log settings for more privacy.
- Noticed one VPS was less stable in some apps, maybe because the IP was more commonly used for VPNs.

## Jun 21

- Added Fail2ban.
- Checked Ubuntu firewall.
- Tried DNS content blocker.
- Did SSH hardening.
- Screenshot:

![SSH hardening notes](images/ssh-hardening.png)

- Added Docker log rotation so logs do not grow too big.

## Jun 22

- AWS Xray crashed because the server did not have enough memory.
- Added 1 GB swap memory and it fixed the crash.
