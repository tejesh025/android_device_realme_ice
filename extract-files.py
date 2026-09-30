#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/oplus',
    'vendor/oneplus/sm8350-common',
    'vendor/qcom/opensource/display',
]

blob_fixups: blob_fixups_user_type = {
    'odm/bin/hw/vendor.oplus.hardware.biometrics.face@1.0-service': blob_fixup()
        .add_needed('libbase_shim.so')
        .clear_symbol_version('_ZN7android4base4TrimERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE')
        .replace_needed('android.hardware.biometrics.face-V1-ndk_platform.so', 'android.hardware.biometrics.face-V1-ndk.so')
        .replace_needed('android.hardware.biometrics.common-V1-ndk_platform.so', 'android.hardware.biometrics.common-V1-ndk.so'),
    'odm/etc/camera/CameraHWConfiguration.config': blob_fixup()
        .regex_replace('SystemCamera =  0;  0;  1;  1;  1', 'SystemCamera =  0;  0;  0;  0;  1'),
    ('odm/lib/liblvimfs_wrapper.so', 'odm/lib64/libCOppLceTonemapAPI.so', 'odm/lib64/libaps_frame_registration.so', 'vendor/lib64/libalsc.so'): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'odm/lib64/libAlgoProcess.so': blob_fixup()
        .replace_needed('android.hardware.graphics.common-V1-ndk_platform.so', 'android.hardware.graphics.common-V7-ndk.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'ice',
    'realme',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, '../oneplus/sm8350-common', module.vendor
    )
    utils.run()
