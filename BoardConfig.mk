#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8350-common/BoardConfigCommon.mk

DEVICE_PATH := device/realme/ice

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_CONFIG += vendor/oplus_yupik_QGKI.config

# Partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 10196353024 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_SUPER_PARTITION_SIZE := 10200547328

# Clang flags
TARGET_KERNEL_CLANG_VERSION := r547379
TARGET_KERNEL_LLVM_BINUTILS := 1
TARGET_KERNEL_ARCH := arm64

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# OPLUS Camera
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/oplus/camera/sepolicy/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    vendor/oplus/camera/sepolicy/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    vendor/oplus/camera/sepolicy/public

# Include the proprietary files BoardConfig.
include vendor/realme/ice/BoardConfigVendor.mk
