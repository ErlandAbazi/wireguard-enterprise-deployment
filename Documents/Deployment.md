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

### Network

Think about the subnet that you wish to assign the clients/peers. On Mikrotik there is an additional opportunity for a nested subnet if you are constrained on access to resources and cannot use a different subnet - WireGuard's point-to-point traffic flow allows for it. That will be shown as an extra configuration example for those who wish to make use of it.

### NAT&Firewall

It's important to understand that as traffic arrives on the router, it needs to know precisely where to forward this traffic. Not only will the right port need to be configured on the clients themselves, but a destination NAT rule will serve to forward incoming traffic to the WireGuard virtual interface. Only then will a handshake between client and server be possible. Additionally, current filter rules will need to be reviewed in case traffic is blocked.

### Peers

After you have sorted out traffic flow, you can then start adding peers. The only variables required for a peer connection are name, public key and allowed address. You can assign the name and allowed address as you prefer, but the public key will need to be either generated or retrieved from the client itself.

## Step 2: Set Up Windows Server GPOs

### Installer and its GPO Configuration

First you need to get the .msi from WireGuard's [website](https://download.wireguard.com/windows-client/), which will need to be placed on a network share accesible by all clients that you wish to deploy this to. Next, from the Group Policy Management Console you'll create and link a GPO to the Organizational Unit where you want the installation to take place. On this GPO you must choose the Software Installation link and point it to the network path of the installer you got before.

### Limited UI Access

For a user to have access to the WireGuard software interface in cases where there's an outage, they'll require a registry key to be present in their system that will allow limited UI access. In addition, they will need to be assigned to the **Network Configuration Operators** group to be able to actually turn off or change the tunnel to a backup. You will need to create another GPO which will include the registry key and this group access for the users in question.

## Step 3: Client Configuration

### Windows Client

The application will be installed from the GPO you've configured, however you will need to log in as a member of the Administrators group to be able to add or edit the tunnels. After you have created the tunnel as you require, the last step is a powershell command that will make the named tunnel you created start on boot.

### MacOS&Linux Client

Since most popular distributions come with WireGuard built-in you can easily manage this through the Networks GUI. But if you wish to do it from the terminal, the way to go is by importing tunnel configuration files. In MacOS, you'll have to get the WireGuard app from the App Store and do the same there. If you wish to generate tunnel .conf files I highly recommend this [website](https://wireguardconfig.com). 

### Mobile Devices Setup

The application is available from the App/Play Store. The best way I've found to deploy this for mobile is via the same [website](https://wireguardconfig.com/qrcode) as above, which means you only need to replace the keys and the address once you have your template ready. Then you'll send the QR code generated through your company approved channels to be scanned by any end users that need it.




