#!/bin/bash
# Script for auto configure passthrouh
#to run in Linux root under root user:  
# curl -o- https://raw.githubusercontent.com/alttehn/Proxmox-ServerSetup/master/GPU_passthrough_main_script.sh | bash
echo "Welcome to PCI GPU passthrough script! \r Before we start enable in your BIOS: VT-d:Enable, Intel Vitrualization Technology:Enable, Primary Graphx adapter:VGA, Above 4G Decoding:Enable."
read -p "Please press [Enter] to continue..."


