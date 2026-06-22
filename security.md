# Security Notes

## SSH settings

These settings were used to make SSH safer:

```text
PasswordAuthentication no
KbdInteractiveAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
X11Forwarding no
PermitTunnel no
```

For one VPS I used `PermitRootLogin prohibit-password`, but the stricter setting is `PermitRootLogin no`.

## Firewall

The AWS Lightsail firewall only allowed:

- SSH on port `22`
- HTTPS / VPN on port `443`

IPv6 was disabled because I only needed IPv4 for this setup.

## Logging settings

Access logs are disabled. Error logs are also disabled in my current config.

Current log settings:

```json
{
  "log": {
    "access": "none",
    "error": "none",
    "loglevel": "none",
    "dnsLog": false,
    "maskAddress": "full"
  }
}
```

If I am debugging later, I can temporarily turn error logs back on. These are the commands I used before when logs existed:

```bash
sudo ls -lah /var/log/xray
sudo journalctl -u xray -n 20 --no-pager
```

Old logs can be cleared without deleting the file:

```bash
sudo truncate -s 0 /var/log/xray/error.log
sudo journalctl --vacuum-time=1s
```

## Routing privacy

The current config blocks private IP ranges:

```json
{
  "ip": [
    "geoip:private"
  ],
  "outboundTag": "BLOCK",
  "type": "field"
}
```

This is to avoid proxy traffic trying to reach private network addresses.

## Docker log rotation

For Docker, I changed logging so it does not grow forever:

```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "1"
  }
}
```

## Extra security

- Fail2ban was added
- Ubuntu firewall was checked
- DNS content blocker was tried
- SSH hardening was done

## Do not upload

- key files
- user IDs
- short IDs
- subscription links
- server passwords
- real client configs
