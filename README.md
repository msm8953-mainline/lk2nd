# This project is not maintained
It is recommended to use [msm8916-mainline/lk2nd](https://github.com/msm8916-mainline/lk2nd) instead. 

# lk2nd
lk2nd is a bootloader for Qualcomm MSM devices,
based on the [CodeAurora Little Kernel fork](https://source.codeaurora.org/quic/la/kernel/lk/).
It provides an Android Fastboot interface on devices where the stock bootloader
does not provide Fastboot (e.g. Samsung).

lk2nd does not replace the stock bootloader. It is packaged into an Android
boot image and then loaded by the stock bootloader as a "secondary" bootloader.
The real Android boot image is placed into the boot partition with 1 MB offset,
and then loaded by lk2nd.

## Supported SoCs
- MSM8952 (MSM8940)
- MSM8953 (SDM450,SDM625,SDM626)
- SDM632

### Supported devices
- 10or G (G)
- Motorola Moto G4 Play (harpia)
- Motorola Moto G5 Plus (potter)
- Motorola Moto G6 (ali) NOTE: Build with motorola-ali-secondary
- Samsung Galaxy A3 (2015) - SM-A300FU
- Samsung Galaxy A5 (2015) - SM-A500FU
- Samsung Galaxy J5 (2016) - SM-J510FN
- Samsung Galaxy J8 (2018) - SM-J810M
- Samsung Galaxy S4 Mini Value Edition - GT-I9195I
- Samsung Galaxy Tab A 8.0 LTE (2015) - SM-T357W
- Samsung Galaxy Tab A 9.7 WiFi (2015) - SM-T550
- Wileyfox Swift
- Samsung Galaxy A6+ (2018) - SM-A605FN
- Xiaomi Redmi 4X - santoni
- Xiaomi Redmi Note 4X Snapdragon - mido
- Xiaomi Redmi 4 Prime - markw
- Xiaomi Redmi 5 - rosy
- Xiaomi Redmi Note 5 / 5 Plus Snapdragon - vince
- Xiaomi Redmi S2 / Y2 - ysl
- Xiaomi Redmi 6 Pro - sakura
- Xiaomi Redmi 7 - onclite
- Xiaomi Redmi 7A - pine
- Meizu M6 Note - m1721
- Motorola Moto G7 Power - ocean
- Xiaomi Mi A2 Lite - daisy
- Xiaomi Mi A1 - tissot
- Samsung Galaxy Tab A2 XL WiFi (2018) - SM-T590
- Huawei Maimang 5 / Nova (Plus) / G9 (Plus) - milan
- Lenovo P2 - kuntao

## Installation
1. Download `lk2nd.img` (as of now there's no build available so you'll need to build it yourself.)
2. Flash `lk2nd.img` using the stock flashing procedure:
  - Fastboot: `fastboot flash boot lk2nd.img`
  - Samsung: `heimdall flash --BOOT lk2nd.img`

## Usage
lk2nd provides the standard Android fastboot protocol for flashing/booting Android boot images.

Press `Volume Down` while booting to enter Fastboot mode.
Press `Volume Up` while booting to boot into Recovery mode.

**Note:** If your stock bootloader uses the same key combinations, you need to wait a bit before
pressing the volume keys. Usually, waiting until the screen turns on and/or the device vibrates
should be enough to make the stock bootloader ignore the keys.

`fastboot flash lk2nd lk2nd.img` can be used to update lk2nd directory from its
fastboot interface.

**Note:** `fastboot flash boot boot.img` will flash the actual boot image with 1 MB offset
into the boot partition. This is done to avoid replacing lk2nd (since it is also booted from
the boot partition).

Other fastboot commands work normally.

## Building
```
$ make TOOLCHAIN_PREFIX=arm-none-eabi- <SoC>-secondary
```

**Requirements:**
- ARM (32 bit) GCC tool chain
  - Arch Linux: `arm-none-eabi-gcc`
- [Device Tree Compiler](https://git.kernel.org/pub/scm/utils/dtc/dtc.git)
  - Arch Linux: `dtc`

Replace `TOOLCHAIN_PREFIX` with the path to your tool chain.
`lk2nd.img` is built and placed into `build-<SoC>-secondary/lk2nd.img`.
