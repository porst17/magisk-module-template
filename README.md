# Swap2System

## Description
This module allows to utilize unused space on `/system` as swap space.

## Changelog

### [Unreleased](unreleased)

### [0.2.0]
- rename `/system/swapfile.swp` to `/system/swapfile`
- mount `/system/swapfile` directly (no external mount-point needed)

### [0.1.0] 
- Bind mount `/system/swapfile.swp` to `/data/swapfile.swp` with read-write access
- `swapon /data/swapfile.swp`

[unreleased]: https://github.com/porst17/swap2system/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/porst17/swap2system/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/porst17/swap2system/compare/v0.0.0...v0.1.0

## Requirements
- Some free space on `/system`

## Instructions
- Open a terminal locally or via `adb shell`, then create the swap file:
```
su
mount -o rw,remount /system
dd if=/dev/zero of=/system/swapfile
mkswap /system/swapfile
mount -o ro,remount /system
```

## Links
[Swap2System on GitHub](https://github.com/porst17/swap2system)

## DISCLAIMER
Using flash memory as swap space may reduce its lifetime due to frequent write
accesses.