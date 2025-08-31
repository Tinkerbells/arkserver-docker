#!/bin/sh
if [[ $EUID -ne 0 ]]; then
  echo "This must be run as root"
  exit 1
fi
for port in 7777 7778 27015; do
  iptables -t filter -I INPUT -p udp --dport $port -j ACCEPT
done

echo "Finshied!"
#Uncomment the next if you want to open the default rcon port
#iptables -t filter -I INPUT -p tcp --dport 27020 -j ACCEPT
