# Troubleshooting Guide

This page covers common WireGuard deployment issues and how to fix them — focused on MikroTik, Windows, and mobile clients. I will try to cover some important issues we've identified and how you can resolve them should a mistake come to pass.

## Wiping the server interface configuration on Mikrotik:
We're considering the deletion of the virtual interface either due to the private key not being backed up after a device goes down or from an administrator's mistake. 
- Consequence
        1. Immediate lack of internet access on every domain joined computer if 
```
allowedIPs = 0.0.0.0/0
```
which means you wanted all traffic to be routed through the WireGuard tunnel.
	2. Users are unable to stop the Wireguard service on their profile unless you've configured *LimitedUIaccess* registry key and added these users to the "Network Configuration Operators" group.
        3. Remote control via a Remote Management Software (teamviewer,action1,anydesk) or Windows Remote Assistance is not possible.
- Solution
        1. Long term solution is the safety and restoration of Mikrotik backups.
        2. If the previous is not possible, the interface's private key needs to be stored safely and used to restore the configuration of key pairing. This will prevent the complete re-configuration of every client.
        3. Immediate solution is offline credential access from the client through the Administrators Security Group members and manually deactivating the Wireguard tunnel. Only after this change can you remotely access the endpoint. Replace the PublicKey line as required after the new key pair.

## Primary internet service provider goes down:
If you live in a country where network uptime from your ISP is not one to meet the usual SLA's 99.95%, you most probably have a backup service provider setup. This will highlight the issues we've faced whenever our primary ISP went down.
- Consequence
        1. Immediate lack of internet access on every domain joined computer due to all traffic being routed through the tunnel.
        2. Remote control via Action1 or Windows Remote Assistance is not possible.
- Solution
	1. Adding the user to the "Network Configuration Operators" security group will give them limited UI access to stop the primary tunnel and activate the backup. 
	2. Choose to route only required traffic to internal resources through the tunnel. 

Just to clarify, these are by no means problems related to WireGuard itself but those our department has faced and had to maneuver around.		

## A few useful Mikrotik commands:
To quickly check your peers configuration:
```
/interface/wireguard/peers/print
```
This one will show your virtual interface's IP:
```
/ip/address/print
```
Firewall rules to determine if traffic is supposed to go through:
```
/ip/firewall/filter/print
```
To show NAT settings if your handshake is not passing any traffic:
```
/ip/firewall/nat/print
```

A final suggestion:
1. Use /32 to configure peer addresses.
2. Avoid overlapping AllowedIPs.
3. Double check the key pair, always.
