 # Versioning of the ROM
  ROM_VERSION := $(PLATFORM_VERSION)-$(shell date +%Y%m%d)-$(TESLA_RELEASE_TYPE)-$(subst gzr_,,$(TARGET_PRODUCT))
 TESLA_VERSION := $(PLATFORM_VERSION)-$(TESLA_RELEASE_TYPE)
 
 PRODUCT_PROPERTY_OVERRIDES += \
     ro.tesla.version=$(ROM_VERSION)

