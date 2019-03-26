#!/bin/bash
# Script for auto configure passthrouh
#to run in Linux root under root user:  
# curl -o- https://raw.githubusercontent.com/alttehn/Proxmox-ServerSetup/master/GPU_passthrough_main_script.sh | bash
echo "Welcome to PCI GPU passthrough script! \n Before we start enable in your BIOS: VT-d:Enable, Intel Vitrualization Technology:Enable, Primary Graphx adapter:VGA, Above 4G Decoding:Enable."
echo «xxxx»
read Nothing
echo «xxxx»
read -p "Please press [Enter] to continue..."
echo «xxxx»
choice=4
# Choise
echo «What is the manufactory of your CPU?»
echo «1. Intel Processor»
echo «2. AMD Processor»
echo -n «Please choose 1 or 2 ? »
# Waiting
# Зацикливание
while [ $choice -eq 4 ]; do

read choice


