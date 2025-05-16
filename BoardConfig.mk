#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/courbet/BoardConfigVendor.mk

# Device tree path
DEVICE_PATH := device/xiaomi/courbet

# Assert
TARGET_OTA_ASSERT_DEVICE := courbet,courbetin

# Audio
TARGET_PROVIDES_AUDIO_EXTNS := true

# Display
TARGET_SCREEN_DENSITY := 440

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000

TARGET_KERNEL_CONFIG := courbet_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/courbet
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-r522817

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE := androidboot.memcg=1
BOARD_KERNEL_CMDLINE := lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE := msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE := service_locator.enable=1
BOARD_KERNEL_CMDLINE := swiotlb=1
BOARD_KERNEL_CMDLINE := androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE := loop.max_part=7
BOARD_KERNEL_CMDLINE := buildvariant=user

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := qualcomm_dynamic_partitions
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_PARTITION_LIST := system product system_ext vendor odm
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# User image partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
