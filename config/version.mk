# Versioning System
HAVOC_BASE_VERSION = 2.8

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

# Set all versions
HAVOC_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
HAVOC_VERSION := Havoc-OS-v$(HAVOC_BASE_VERSION)-$(HAVOC_BUILD_DATE)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
HAVOC_DATE := $(shell date -u +%d-%m-%Y)
HAVOC_FINGERPRINT := Havoc-OS/v$(HAVOC_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(HAVOC_BUILD_DATE)

export HAVOC_BASE_VERSION
export HAVOC_DATE
export HAVOC_FINGERPRINT
export HAVOC_BUILD_TYPE
export HAVOC_VERSION
