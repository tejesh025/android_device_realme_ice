#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ice device
$(call inherit-product, device/realme/ice/device.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_ice
PRODUCT_DEVICE := ice
PRODUCT_MANUFACTURER := realme
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3461
PRODUCT_SYSTEM_NAME := RE54BFL1
PRODUCT_SYSTEM_DEVICE := RE54BFL1
PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Disable OMX Service
TARGET_SUPPORTS_OMX_SERVICE := false

# Boot animation resolution, choose from 480, 720, 1080, 1440.
# Default is 1080
TARGET_BOOT_ANIMATION_RES := 1080

#AXION BUILD FLAGS

TARGET_DISABLE_EPPE := true

# Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 48,2,2
AXION_CAMERA_FRONT_INFO := 16

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := nobody_(trust)

# Processor name (underscores become spaces)
AXION_PROCESSOR := Qualcomm_Snapdragon_778G

TARGET_IS_LOW_RAM ?= false

PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := schedutil
PERF_ANIM_OVERRIDE := true

GPU_FREQS_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies
GPU_MIN_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
GPU_MAX_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/max_freq

TARGET_SUPPORTED_REFRESH_RATES := 60,90,120,144


PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc=$(call normalize-path-list, "RMX3461-user 13 TP1A.220905.001 R.1119f23-59b8-59b9 release-keys") \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME) \
    BuildFingerprint=realme/RMX3461/RE54BFL1:13/TP1A.220905.001/R.1119f23-59b8-59b9:user/release-keys
    SystemDevice=RE54BFL1 \
    SystemName=RE54BFL1

