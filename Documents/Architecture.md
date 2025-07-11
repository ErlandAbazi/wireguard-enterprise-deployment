# Architecture Overview

This document outlines the architecture of this WireGuard-based VPN deployment, with a MikroTik router acting as the central VPN server and remote clients connecting from Windows, mobile, and other platforms.

The design focuses on:

- Simplicity.
- Sustainability.
- Real-world usability for SMB/enterprise IT environments.

## Network Topology

```
Remote Clients initiate 
       │ UDP 51820
       ↓
ISP routes the packet
       │
       ↓
[MikroTik Router] Packet arrives at listening WireGuard Server port
       │dst-nat rule sends it to WireGuard interface IP 
       ├─┐ Packet arrives at WireGuard interface
         ├─ Internal services (AD, file servers, etc.)
```

## Key Components

1. MikroTik Router (VPN Server)

- Router OSv7+ is a must.
- One peer entry per remote client.
- Allowed IPs per client, highly recommend /32.
- NAT and IP addressing is configured here.

*See [a configuration example here](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Configuration-Examples.md).*

2. Windows Clients

- WireGuard installed via GPO.
- Configuration files are deployed per machine.
- Powershell command enables tunnel start before logon to sync AD.
- Registry and security group editing required for tunnel switching.

*Details at [deployment.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Deployment.md).*

3. Mobile Clients

- Get the app from App/Play Store.
- Configuration is imported via QR code scanning or manually entered.
- These devices are also assigned as /32 to avoid any kind of overlap.

4. MacOS&Linux

- The app is available on the App Store, while most Linux distros now ship with WireGuard built-in.
- Configuration is done either manually on the GUI, or via a tunnel file.

## IP Allocation and Routing

| Component        | IP Example         | Notes                              |
| ---------------- | ------------------ | ---------------------------------- |
| MikroTik WG int  | `192.168.1.1/24`   | Server side of the VPN tunnel      |
| Laptop Client    | `192.168.1.2/32`   | Assigned in `[Interface]` Address  |
| Android Client   | `192.168.1.3/32`   | Static assignment                  |
| LAN 1            | `192.168.2.0/24`   | Related subnet hosting resources   |
| Default-gateway  | `192.168.1.254/24` | WireGuard subnet gateway           |

WireGuard peers connect point-to-point with 192.168.1.1 over the internet, which then routes traffic towards the default gateway.

## Key Exchange and Security

- Each client generates a key pair.
- Server adds only the client's public key, name and allowed IP.
- Clients are configured with server's public key, public IP and port.
- No usernames or certificates are involved.

## Traffic Flow Example

1. Windows client boots up and the WireGuard service tunnel starts before logon screen.
2. Encrypted tunnel establishes connection over UDP to MikroTik's public IP.
3. This client is given the `192.168.1.2` private address.
4. The client can now access internal resources assuming firewall isn't in the way.
5. The client will query the DNS server(s) under [Interface] block to reach the internet.

### Diagram
Consult the diagram in [Topology.png](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/tree/main/Images/Topology.png) for an idea of what is going on.
