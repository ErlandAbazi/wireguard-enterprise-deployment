# Deployment Guide

This guide will walk you through deploying WireGuard using a MikroTik router as the server and the clients configured via **Group Policy**. It also includes support for mobile devices and registry-based tweaks. This document will show the entire process and if you simply want to see the commands, please consult with [Configuration-Examples.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Configuration-Examples.md).

## Prerequisites

- MikroTik router with **RouterOS v7+**.
- Access to *Active Directory Users and Computers* and *Group Policy Management Console*.
- WireGuard client MSI installer for Windows. App Store permissions on MacOS&IOS. 
- Public IP address or DNS name for the MikroTik device.
- Firewall access to the ports.
- A site to generate key pairs. I highly recommend [wg.orz.tools](https://wg.orz.tools/).


##  Step 1: Set Up MikroTik WireGuard Server

### Interface

WireGuard's virtual interface has to be created first. You have to consider the name, the listen port which is where the router will respond to requests and forward them accordingly, and the private/public key pair.

- Use WireGuard and then WireGuard again to add the interface.

### Network

Think about the subnet that you wish to assign the clients/peers. On Mikrotik there is an additional opportunity for a nested subnet if you are constrained on access to resources and cannot use a different subnet - WireGuard's point-to-point traffic flow allows for it. That will be shown as an extra configuration example for those who wish to make use of it.

- This subnet can now be configured under IP Addresses and linked to the virtual WireGuard interface.

### NAT&Firewall

It's important to understand that as traffic arrives on the router, it needs to know precisely where to forward this traffic. Not only will the right port need to be configured on the clients themselves, but a destination NAT rule will serve to forward incoming traffic to the WireGuard virtual interface. Only then will a handshake between client and server be possible. Additionally, current filter rules will need to be reviewed in case traffic is blocked.

- A dst-NAT rule and a new filter rule will be required.

### Peers

After you have sorted out traffic flow, you can then start adding peers. The only variables required for a peer connection are name, public key and allowed address. You can assign the name and allowed address as you prefer, but the public key will need to be either generated or retrieved from the client itself.

- All peers can be added under the WireGuard interface menu, Peers tab.

## Step 2: Set Up Windows Server GPOs





