#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/huawei/msm7x27a-common/msm7x27a.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8950/overlay

PRODUCT_COPY_FILES += \
	device/huawei/u8950/rootdir/fstab.huawei:root/fstab.huawei \
	device/huawei/u8950/rootdir/init.device.rc:root/init.device.rc \
	device/huawei/u8950/rootdir/1191601.img:root/tp/1191601.img

PRODUCT_COPY_FILES += \
	device/huawei/u8950/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
	device/huawei/u8950/configs/thermald.conf:system/etc/thermald.conf \
	device/huawei/u8950/configs/nvram_4330.txt:system/etc/nvram_4330.txt
	
# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_COPY_FILES += \
	device/huawei/u8950/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/huawei/u8950/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
	device/huawei/u8950/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/huawei/u8950/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
	device/huawei/u8950/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Properties
VERS := u8950V$(shell echo $(PLATFORM_VERSION) | sed 's/\./_/g')
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ksrt12.time=944989200 \
	ro.build.hw_real.version=$(VERS) \
	ro.confg.hw_systemversion=$(VERS)_SYSTEM \
	ro.confg.hw_fastbootversion=$(VERS)_FASTBOOT \
	ro.confg.hw_bootversion=$(VERS)_BOOT

PRODUCT_PROPERTY_OVERRIDES += \
	gsm.version.baseband=1040 \
	rild.libpath=/system/lib/libril-qc-1.so

PRODUCT_PACKAGES += KernelAdiutor RootExplorer

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

#$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product, vendor/huawei/u8950/u8950-vendor.mk)
