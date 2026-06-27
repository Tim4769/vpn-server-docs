# Jun 25

- Started planning a home Wi-Fi setup that can use the existing VPN/proxy system.
- Bought a second-hand HP EliteDesk 800 G4 DM to use as the home server.
- Need two Ethernet ports on the server: one for WAN and one for LAN.
- Bought an M.2 Ethernet board to replace the Wi-Fi card inside the HP server.
- The extra Ethernet port will be used for WAN, and the built-in Intel Ethernet port will be used for LAN.
- Planning to run Proxmox VE on the HP server.
- Planning to run OpenWrt in one VM and a Debian 12 or Ubuntu Server VM/LXC for Docker and the Marzban panel.
- OpenWrt will handle routing and proxy client tools like PassWall2 or OpenClash.

```text
Internet / ISP modem
|
| WAN cable
v
Extra Ethernet port
USB 2.5G / M.2 Ethernet
|
v
HP EliteDesk 800 G4 DM
Proxmox VE
|
|-- VM 1: OpenWrt
|   |-- WAN: extra Ethernet port
|   |-- LAN: built-in Intel Ethernet
|   `-- PassWall2 / OpenClash proxy client
|
`-- VM 2 / LXC: Debian 12 or Ubuntu Server
    `-- Docker + Marzban Panel
|
v
Built-in Intel Ethernet LAN
|
v
Switch / old router in AP mode
|
|-- Windows laptop
|-- Phone
|-- Other devices
`-- Wi-Fi devices
```
