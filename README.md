# Swap2System

## Description
This module allows to utilize unused space on `/system` as swap space.

## Changelog

# v0.1.0
- Bind mount `/system/swapfile.swp` to `/data/swapfile.swp` with read-write access
- `swapon /data/swapfile.swp`

## Requirements
- Some free space on `/system`

## Instructions
- Open a terminal locally or via `adb shell`, then create the swap file:
```
su
mount -o rw,remount /system
dd if=/dev/zero of=/system/swapfile.swp
mkswap /system/swapfile.swp
mount -o r,remount /system
```

## Links
[Swap2System on GitHub](https://github.com/porst17/swap2system)

## DISCLAIMER
Using flash memory as swap space may reduce its lifetime due to frequent write
accesses.