#!/bin/sh 
export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

export serverName=$serverName
export worldName=$worldName
export serverPassword=$serverPassword

echo "Starting server PRESS CTRL-C to exit"

# curl ipv4.icanhazip.com

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 -name "$serverName" -port 2456 -world "$worldName" -password "$serverPassword" -nographics -batchmode -public 0
  
export LD_LIBRARY_PATH=$templdpath

