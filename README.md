
# Simple killswitch for vpn
Just a few batch files to enable/disable a killswitch for vpn

The main purpose of this program is to prevent switching back to your own lcoal connection upon unstable vpn disconnect, which will leak your local public ip to the service you are currently connected to.

Specially made for Blue Protocol JP release for SoftEther VPN overseas users -> prevent ip leak to Bandai Namco if/when vpn disconnects due to instability.

Dedicated and made for to the Umbrage SG community :)

## Usage
1. Find your default gateway ip (ipconfig) and vpn ip (softether vpn client)
2. Edit config.txt with your gateway and vpn ip
3. Run enable.bat to enable the killswitch
   - This will block all traffic except for your vpn ip
4. Connect to vpn and start the game
5. Run click disable.bat to disable the killswitch when you are done
   - This will allow all traffic back again
