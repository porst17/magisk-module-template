# Swap2System

## Description
This module allows to utilize unused space on `/system` as swap space.
It also add some zram as swap.

## Changelog

### [Unreleased](unreleased)

### [0.3.0]
- raise minimum Magisk version to 20
- add 196MB zram swap

### [0.2.0]
- rename `/system/swapfile.swp` to `/system/swapfile`
- mount `/system/swapfile` directly (no external mount-point needed)

### [0.1.0] 
- Bind mount `/system/swapfile.swp` to `/data/swapfile.swp` with read-write access
- `swapon /data/swapfile.swp`

[unreleased]: https://github.com/porst17/swap2system/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/porst17/swap2system/compare/v0.2.0...v0.3.0
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

## Build the module
```
zip -r swap2system-$(grep 'version=' module.prop  | grep -o '[0-9].*')\($(grep 'versionCode=' module.prop  | grep -o '[0-9][0-9]*')\).zip * -x .gitinore README.md .gitattributes swap2system*.zip
```

## Links
[Swap2System on GitHub](https://github.com/porst17/swap2system)

## DISCLAIMER
Using flash memory as swap space may reduce its lifetime due to frequent write
accesses.