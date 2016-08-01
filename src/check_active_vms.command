#!/bin/bash

# check for active VMs

vms=$(~/bin/corectld status | grep "Active VMs:" | awk '{print $3}')

if [[ "$vms" -ne "0" ]]; then
    # active VMs
    echo $vms
else
    # no vms
    echo "0"
fi
