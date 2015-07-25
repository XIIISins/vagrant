#!/bin/bash
#Extract prvilege token for easy use.
TS3LOGS="/home/ts3/teamspeak3-server_linux-amd64/logs/"
grep -i token $TS3LOGS* |awk '{print $6}' > /tmp/token
