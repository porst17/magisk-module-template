#!/system/bin/sh

# Uncomment for debugging purposes
#exec > /cache/swap2system.log
#exec 2>&1
#set -x

# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# Bind-mount /system/swapfile to itself to be able to remount it in read-write mode
mount --bind /swapfile /swapfile

# Remount /system/swapfile in read-write mode
mount -o rw,remount /swapfile

# Enable the on-disk swapfile with low priority
toybox swapon -p 0 /swapfile

# set zram swap size
echo 196M > /sys/class/block/zram0/disksize

toybox mkswap /dev/block/zram0

# Enable zram swap with higher priority compared to on-disk swap
toybox swapon -p 1 /dev/block/zram0
