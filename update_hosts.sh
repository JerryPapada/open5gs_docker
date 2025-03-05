#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <hplmn_ip> <vplmn_ip>"
    exit 1
fi

# Assign arguments to variables
hplmn_ip=$1
vplmn_ip=$2

# Entries to add for hplmn
hplmn_entries=(
"$hplmn_ip ausf.5gc.mnc001.mcc001.3gppnetwork.org"
"$hplmn_ip nrf.5gc.mnc001.mcc001.3gppnetwork.org"
"$hplmn_ip sepp.5gc.mnc001.mcc001.3gppnetwork.org"
"$hplmn_ip udm.5gc.mnc001.mcc001.3gppnetwork.org"
"$hplmn_ip udr.5gc.mnc001.mcc001.3gppnetwork.org"
)

# Entries to add for vplmn
vplmn_entries=(
"$vplmn_ip amf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip ausf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip bsf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip nrf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip nssf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip pcf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip sepp.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip smf.5gc.mnc070.mcc999.3gppnetwork.org"
"$vplmn_ip upf.5gc.mnc070.mcc999.3gppnetwork.org"
)

# Write hplmn entries to /etc/hosts
for entry in "${hplmn_entries[@]}"; do
    if ! grep -q "$entry" /etc/hosts; then
        echo "$entry" >> /etc/hosts
    fi
done

# Write vplmn entries to /etc/hosts
for entry in "${vplmn_entries[@]}"; do
    if ! grep -q "$entry" /etc/hosts; then
        echo "$entry" >> /etc/hosts
    fi
done

echo "Entries added to /etc/hosts successfully."
