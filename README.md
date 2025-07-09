# Wireguard Enterprise Deployment 

A real-world guide based on my own experience for deploying [WireGuard VPN](https://wireguard.com) as a viable solution for Windows, MacOS, Linux and mobile clients (Android&iOS) in an enterprise environment.

---

## What will this repository cover?

- Architecture overview: Mikrotik Router serving as the WireGuard server, clients (Windows/MacOS/Linux/mobile).
- Group Policy Object(GPO) based deployment of WireGuard for our domain-joined Windows clients.
- A registry string required for WireGuard interface interaction for domain authenticated users.
- Troubleshooting for various scenarios.
- Configuration examples.

---

## Architecture

- **Server**: MikroTik Router (ROSv7)
- **Clients**:
	- Windows 10/11 via GPO deployment
	- MacOS with manual scripting
	- Linux via a generated tunnel file
	- Mobile devices (iOS/Android) with QR setup
- **Transport**: UDP, usually port 51820 on clients unless configured otherwise, custom port on the server.
- **Management**: Windows Server for GPO/Registry, WinBox v4 for Mikrotik Router configuration.
Refer to [Documents/Architecture.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Architecture.md) for a full diagram and explanation.
