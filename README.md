# Wireguard Enterprise Deployment 

A real-world guide based on my own experience for deploying [WireGuard VPN](https://wireguard.com) as a viable solution for Windows, MacOS, Linux and mobile clients (Android&iOS) in an enterprise environment.

## What will this repository cover?

- Architecture overview: Mikrotik Router serving as the WireGuard server, clients (Windows/MacOS/Linux/mobile).
- Group Policy Object(GPO) based deployment of WireGuard for our domain-joined Windows clients.
- A registry string required for WireGuard interface interaction for domain authenticated users.
- Troubleshooting for various scenarios.
- Configuration examples.

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

## Quickstart

1. **Mikrotik Router Configuration**
	- Add WireGuard IP address
	- Configure NAT rule and firewall
	- Add WireGuard interface
	- Create peers and allowed IPs
- Example: [Configuration/Server.conf](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Configuration/Server.conf)

2. **Windows Server Deployment**
	- Configure GPO for silent WireGuard installation
	- Additional GPO for registry key and the security group access
- See [Documents/Deployment.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Deployment.md)

3. **Client Setup**
	- How to's for manual configuration or scanning from `wg genqr` output
	- Examples available in `images/` or in [Documents/Configuration-Examples.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Configuration-Examples.md)

---

# Advantages

- Lightweight and modern VPN tunnel.
- Full control over keys and configuration.
- Simple enough to configure for Windows deployments.
- Native WireGuard support from MikroTik.
	- See [Documents/Advantages.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Advantages.md)

# Known Limitations

- Key based authentication layer.
- Clients will require manual provisioning.

# Repository Structure

- Documents -> Details about the configuration
- Configuration -> Examples from MikroTik, Windows Server and Clients
- Images -> Diagrams and QR examples
- Scripts -> Hopefully helpful scripts 

## Contributions 

Pull requests are welcome for improvements or corrections.
Do feel free to fork and adapt for your own environment and deployment scenarios.

## References

- [Wireguard Official Site](https://wireguard.com)
- [Mikrotik WireGuard Documentation](https://help.mikrotik.com/docs/spaces/ROS/pages/69664792/WireGuard)
 - [WireGuard GPO Deployment](https://github.com/WireGuard/wireguard-windows)
