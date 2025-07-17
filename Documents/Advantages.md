---
layout: default
title: Advantages
---

# Advantages of WireGuard in Enterprise Deployment

This document will outline the practical advantages observed during deployment in our company. This guide isn't meant as a deep dive into WireGuard code or its cryptography - for that, please reference the original project's documentation and [whitepaper here](https://wireguard.com/papers/wireguard.pdf). 

## 1. Simplicity and Approachability

WireGuard doesn't feel like 'developer-only' software. It's:

- Small in scope.
- Does two things well: security and performance.
- Free from confusing options, certificate chains and documentation.

You won't need a coding background to understand how it works, and most of the behavior will make a lot of sense as you focus on perfecting the deployment for your own environment.

## 2. Straightfoward Installation

This software is available for all major platforms:

- **Windows**: .exe and .msi installer with support for silent installation.
- **Linux**: built-in for most distributions; available in GUI as well.
- **macOS&iOS**: available in the App Store.
- **MikroTik**: native support in RouterOS v7+.

## 3. Clear and Readable Documentation

The official documentation is an example for other projects:
- One page fitting as seen in [wireguard's homepage](https://wireguard.com).
- Configuration examples are available alongside the commands.
- No endless PDFs or outdated forums.

## 4. Simple Configuration

The basic configuration uses .conf file like:

```
[Interface]
PrivateKey = <this will be automatically generated>
Address = <server given address>
DNS = <dns servers to query>

[Peer]
PublicKey = <server's key>
AllowedIPs = <routed traffic>
Endpoint = <publicIP:port>
```

## 5. Fast

From our testing, WireGuard performs much better than OpenVPN or L2TP/IPSec:

- Immediate connection.
- Uses very few resources (rather important for routers and mobile).
- Handles network switching (Wi-Fi to 5G) very well.

## 6. Maintenance

- You can audit access and keys easily.
- No certificate revocation lists or keychains to maintain.

---

*If you're a fan of boring simplicity as well, you might get used to this.*
