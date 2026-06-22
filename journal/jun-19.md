# Jun 19

- Thought about using one server for panel and another for nodes.
- Decided not to make the RackNerd panel server also a node.
- Reason: if the panel server also uses too much traffic, the panel or subscription link could be harder to access.
- Added AWS Lightsail as a Marzban node.
- Added Bandwagon as a Marzban node.
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

- Final layout after this:
  - RackNerd VPS: Marzban panel
  - AWS Lightsail VPS: Marzban node
  - Bandwagon VPS: Marzban node

