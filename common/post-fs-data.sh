#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Bind-mount /system/swapfile to itself to be able to remount it in read-write mode
mount --bind /system/swapfile /system/swapfile

# Remount /system/swapfile in read-write mode
mount -o rw,remount /system/swapfile

# Enable the swapfile
swapon /system/swapfile
