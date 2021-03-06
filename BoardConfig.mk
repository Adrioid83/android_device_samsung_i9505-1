# Copyright (C) 2009 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common JF
-include device/samsung/jf-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/i9505/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := GT-I9505,i9505,jflte

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/jf
TARGET_KERNEL_CONFIG         := cyanogen_jf_defconfig
TARGET_KERNEL_VARIANT_CONFIG := jf_eur_defconfig
TARGET_KERNEL_SELINUX_CONFIG := jfselinux_defconfig

#########################
#### TWRP Recovery   ####
#### Common Options  ####
#########################
# Screen Resulution the device uses
DEVICE_RESOLUTION := 1080x1920

# fixes slanty looking graphics on some devices
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# this enables proper handling of /data/media on devices that have this folder for storage
RECOVERY_SDCARD_ON_DATA := true

# enable/disable things like sdcard partitioning etc
BOARD_HAS_NO_REAL_SDCARD := true

# enable/disable the reboot bootloader button on the reboot menu, if your device uses Bootloader Mode instead of Download Mode
TW_NO_REBOOT_BOOTLOADER := true

# enable/disable the reboot downloadmode button on the reboot menu, if your device uses Download Mode instead of Bootloader Mode
TW_HAS_DOWNLOAD_MODE := true

# Enable ICS Crypto Support
TW_INCLUDE_CRYPTO := true

# Path to the internal Storage
TW_INTERNAL_STORAGE_PATH := "/data/media/0"

# Mountpoint for the internal Storage
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"

# Path to the external Storage
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"

# Mountpoint for the external Storage
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"

# Custom Path to the brigthness sys fs control file
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.526593/leds/lcd-backlight/brightness

# Exclude SuperSU install from recovery
TW_EXCLUDE_SUPERSU := true

# Testing: FB2PNG
TW_INCLUDE_FB2PNG := true

######################################
## Additional Partitions to backup  ##
##  define each in recovery.fstab   ##
######################################
## PART1 - EFS
SP1_NAME := "efs"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1

## PART2 - MODEM
SP1_NAME := "modem"
SP1_BACKUP_METHOD := image
SP1_MOUNTABLE := 0
