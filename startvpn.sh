#!/bin/bash

config="default-profile.ovpn"
daemon=false

while [[ "$#" -gt O ]]; do
	case $1 in 
		-c|--config) config="$2" ; shift ;;
		-d|--daemon) daemon=true ;;
		*) echo "Unknown parameter passed $1"; exit 1 ;;
	esac
	shift
done

echo "Configuration: $config"

if [ "$daemon" = true ]; then
	echo "Starting openvpn as background process"
	sudo openvpn --config $config --daemon
else
	sudo openvpn --config $config
fi
