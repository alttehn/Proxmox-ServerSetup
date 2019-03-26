#!/bin/bash
# Script for auto configure passthrouh
#to run in Linux root under root user:   sh -c "$(curl -sSL https://raw.githubusercontent.com/alttehn/Proxmox-ServerSetup/master/GPU_passthrough_main_script.sh)"
#
echo "Welcome to PCI GPU passthrough script! \n Before we start enable in your BIOS: VT-d:Enable, Intel Vitrualization Technology:Enable, Primary Graphx adapter:VGA, Above 4G Decoding:Enable."
read -p "Please press [Enter] to continue..."

# File to Work with on Step 1. Processor»
file='/etc/default/grub'

# Argument for choice
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
# if
if [ $choice -eq 1 ] ; then

echo «You have chosen Intel Processor»
sed -i "s/quiet/quiet intel_iommu=on/" $file

else

if [ $choice -eq 2 ] ; then
echo «You have chosen AMD Processor»
sed -i "s/quiet/quiet amd_iommu=on/" $file
else

if [ $choice -eq 3 ] ; then
choice=4
else
echo «Please make a choice between 1-3 !»
echo «What is the manufactory of your CPU?»
echo «1. Intel Processor»
echo «2. AMD Processor»
echo -n «Please choose 1 or 2 ? »
choice=4
fi
fi
fi

#Apply Update to grub file
update-grub
#=============================================
#Add GPU driver for blacklist in main system
echo "vfio" >> /etc/resolv.conf
echo "vfio_iommu_type1" >> /etc/resolv.conf
echo "vfio_pci" >> /etc/resolv.conf
echo "vfio_virqfd" >> /etc/resolv.conf
#=============================================
# get vfio-pci ids
lspci -nn|grep -iP "NVIDIA|Radeon"
echo ""
echo ""
echo "Please enter your vfio-pci ids, no quotes (e.g. '10de:1234,10de:4321')"
read VFIOID
echo options vfio-pci ids=$VFIOID > /etc/modprobe.d/vfio.conf
echo ""
echo "Your new /etc/modprobe.d/vfio.conf looks like this..."
echo "-----------"
cat /etc/modprobe.d/vfio.conf
echo ""

=================================================
read -p "Script is over. Please press [Enter] to reboot"
reboot
echo "done"