#!/bin/bash

function eraseAllDrives {

# Get System Serial Number and display in the command line.
SERIALSTRING=$(dmidecode -t system | grep Serial)
PREFIX=" Serial Number: "
SERIAL=${SERIALSTRING#"$PREFIX"}

echo "Device Serial Number: ${SERIAL}"

# Create log file on the Desktop titled with the Device Serial Number
mkdir /tmp/BlankState
touch /tmp/BlankState/$SERIAL.log
echo "Log file generated..."

# Display Log file
open /tmp/BlankState

# Confirm we are ready to erase
CONT=""
echo "Erasure of the internal drive will now begin. Continue? Y/n"
read CONT

if [[ $CONT = "Y" ]]
then
    # Erase all internal drives
    nwipe --autonuke --nousb --method=ops2 --verify=last --logfile=/tmp/BlankState/$SERIAL.log
else 
    echo "Device Erase Cancelled!"
fi

}

eraseAllDrives