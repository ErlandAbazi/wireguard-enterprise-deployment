# Project Overview

This project is a **real-world WireGuard enterprise deployment guide**, built from the ground up by a sysadmin for other sysadmins. It provides a working model of how to securely connect remote users using WireGuard with minimal complexity. 

## Purpose

To document and share a **complete VPN deployment strategy** based on:

- WireGuard for secure tunneling.
- A MikroTik router acting as the VPN gateway.
- Windows clients configured through **Group Policy**.
- Registry key tweaks to automate tunnel behavior.
- Mobile device support with minimal user effort.

Rather than being a theoretical solution, this guide shows how to deploy, configure, and manage WireGuard in an **accessible way** for SMBs.

## Intended Audience

This guide is written for fellow sysadmins — especially those working in:

- SMB/enterprise environments.
- Mixed OS environments (Windows, mobile, Linux).
- Remote/hybrid workforce models.
- Teams with limited time for overly complex VPNs.

Whether you’re a one-person IT department or managing hundreds of machines, this project aims to hopefully get you up and running quickly with a working, secure configurations. Adapt as necessary.

## What’s Included in This Repo

| Folder / File           | Description                                                          |
|-------------------------|----------------------------------------------------------------------|
| `README.md`             | Project summary and quickstart instructions                          |
| `Documents/`            | Full documentation: architecture, deployment steps, and explanations |
| `Configuration/`        | Example MikroTik and client configurations                           |
| `Configuration/Scripts/`| Optional helper scripts for deployment                               |
| `LICENSE`               | MIT License details.                                                 |

## Basic Architecture

```
Remote Clients (Win/iOS/Android) 
        │
        ↓
     Internet
        │
        ↓
 MikroTik Router (WireGuard Server)
        │
        ↓
 Internal LAN / Services
```
*More details and diagrams in [Documents/Architecture.md](https://github.com/ErlandAbazi/wireguard-enterprise-deployment/blob/main/Documents/Architecture.md).*

# Contributions Welcome

This is a work in progress guide based on real world experience and implementation and as such, if you have feedback, questions or want to share a better working setup, feel free to open a pull request or issue.
