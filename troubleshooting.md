# Troubleshooting

## Problem: Client timeout

Checked:

```bash
sudo systemctl status xray
sudo ss -ltnp | grep :443
sudo journalctl -u xray -n 100 --no-pager
```

Possible causes:

- Xray not running
- port `443` not open
- wrong SNI
- wrong public key
- wrong short ID
- client config does not match server config

## Problem: REALITY server name mismatch

Cause: client SNI did not match server settings.

Fix: updated the SNI in the client config. My current example uses `www.cloudflare.com`, so the client should match that if this config is used.

## Problem: YouTube or image uploads broken

At one point TCP apps worked, like Google and ChatGPT text. But YouTube and uploading images did not work well.

The fix was adding the correct server name in the client.

## Problem: Private IP traffic should not go through

The current config has a routing rule for `geoip:private`.

Traffic to private IP ranges should go to `BLOCK`, not `DIRECT`.

## Problem: Xray crashed on small VPS

Cause: the AWS server ran out of memory.

Fix: added 1 GB swap memory.

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## Problem: Marzban node using old Xray

Cause: the RackNerd Marzban panel had a newer Xray, but the AWS and Bandwagon nodes were still using old Xray.

Fix: point Marzban and Marzban Node to the newer Xray path:

```text
XRAY_EXECUTABLE_PATH="/var/lib/marzban/xray-core/xray"
```

For Docker nodes, also mount the folder:

```text
- /var/lib/marzban:/var/lib/marzban
```

The RackNerd VPS is the panel, so node problems are usually checked on AWS or Bandwagon first.

## Problem: Proxy conflict

I tested my VPN while another VPN was already connected. It made the client act weird and timeout for a while.

Fix: turn off other VPN/proxy apps before testing this one.
