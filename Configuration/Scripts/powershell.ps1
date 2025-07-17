# This is the script that sets the tunnel to start automatically on boot:

Start-Process 'C:\Program Files\WireGuard\wireguard.exe' -ArgumentList '/installtunnelservice', '<TUNNEL_NAME>.conf' -Wait -NoNewWindow -PassThru | Out-Null
Start-Process sc.exe -ArgumentList 'config', 'WireGuardTunnel$<TUNNEL_NAME>-ATU', 'start= auto' -Wait -NoNewWindow -PassThru | Out-Null
Start-Service -Name WireGuardTunnel$<TUNNEL_NAME> -ErrorAction SilentlyContinue

just replace <TUNNEL_NAME> with the one you configured on the client.
