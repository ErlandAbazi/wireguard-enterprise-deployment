# Mikrotik Sample Configuration:

interface/wireguard/add name=<VIRTUAL_INTERFACE_NAME> listen-port=<LISTEN_PORT> private-key=<SERVER_PRIVATE_KEY>

ip/address/add address=<VIRTUAL_INTERFACE_IP>/<SUBNET MASK> interface=<VIRTUAL_INTERFACE_NAME> network=<NETWORK IP>

ip/firewall/nat/add chain=dstnat dst-address=<YOUR_PUBLIC_IP> protocol=udp dst-port=<LISTEN_PORT> action=dst-nat to-addresses=<VIRTUAL_INTERFACE_IP> to-ports=<LISTEN_PORT>

## Peer: Agent
interface/wireguard/peers/add name=<PEER_NAME> interface=<VIRTUAL_INTERFACE_NAME> public-key=<AGENT_PUBLIC_KEY> allowed-address=<IP>/32

## Peer: Android
interface/wireguard/peers/add name=<PEER_NAME> interface=<VIRTUAL_INTERFACE_NAME> public-key=<ANDROID_PUBLIC_KEY> allowed-address=<IP>/32

