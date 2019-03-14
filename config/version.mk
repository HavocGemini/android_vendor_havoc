# Versioning System
HAVOC_BASE_VERSION = 2.3

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

# Set all versions
HAVOC_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
HAVOC_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(HAVOC_BUILD_DATE)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
HAVOC_DATE := $(shell date -u +%d-%m-%Y)
HAVOC_FINGERPRINT := Havoc-OS/v$(HAVOC_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(HAVOC_BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.base.version=$(HAVOC_BASE_VERSION) \
    ro.havoc.build.date=$(HAVOC_DATE) \
    ro.havoc.fingerprint=$(HAVOC_FINGERPRINT) \
    ro.havoc.releasetype=$(HAVOC_BUILD_TYPE) \
    ro.havoc.version=$(HAVOC_VERSION)
