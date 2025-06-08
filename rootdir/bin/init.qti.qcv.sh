#! /vendor/bin/sh
#=============================================================================
# Copyright (c) 2025 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#=============================================================================

soc_id=`cat /sys/devices/soc0/soc_id` 2> /dev/null

# Store soc_id in ro.vendor.qti.soc_id
setprop ro.vendor.qti.soc_id $soc_id

# For chipsets in QCV family, convert soc_id to soc_name
# and store it in ro.vendor.qti.soc_name.
if [ "$soc_id" -eq 365 ]; then
    setprop ro.vendor.qti.soc_model SM7150
elif [ "$soc_id" -eq 355 ]; then
    setprop ro.vendor.qti.soc_model SM6150
fi
