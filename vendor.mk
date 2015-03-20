PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/tesla/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/tesla/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \
    vendor/tesla/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/tesla/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# vendor-specific init file
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/init.local.rc:root/init.vendor.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/tesla/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/tesla/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Required packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    Launcher3 \
    BluetoothExt \
    LockClock

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    SoundRecorder

# Telephony packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    CellBroadcastReceiver \
    VoiceDialer

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/tesla/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# World APN list
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/tesla/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/tesla/overlay/common \
    vendor/tesla/overlay/dictionaries


# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

$(call inherit-product-if-exists, vendor/extra/product.mk)

# Versioning System
ANDROID_VERSION = 5.1.0
TESLA_VERSION = v1.0

ifndef TESLA_BUILD_TYPE
    TESLA_BUILD_TYPE := BETA
    PLATFORM_VERSION_CODENAME := BETA
endif

# Set all versions
TESLA_VERSION := TESLA_$(TESLA_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(TESLA_VERSION)-$(TESLA_BUILD_TYPE)
TESLA_MOD_VERSION := TESLA_$(TESLA_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(TESLA_VERSION)-$(TESLA_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.tesla.version=$(TESLA_VERSION) \
    ro.mod.version=$(TESLA_BUILD_TYPE)-v9.2 \
