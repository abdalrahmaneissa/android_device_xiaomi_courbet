#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from missi device
$(call inherit-product, device/qualcomm/missi/device.mk)

PRODUCT_DEVICE := missi
PRODUCT_NAME := lineage_missi
PRODUCT_BRAND := qti
PRODUCT_MODEL := missi system image for arm64
PRODUCT_MANUFACTURER := qualcomm

PRODUCT_GMS_CLIENTID_BASE := android-qualcomm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="missi-user 13 TKQ1.221013.002 V14.0.4.0.TKQMIXM release-keys"

BUILD_FINGERPRINT := qti/missi/missi:13/TKQ1.221013.002/V14.0.4.0.TKQMIXM:user/release-keys
