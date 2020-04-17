ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libpddokdo
libpddokdo_FILES = libpddokdo.m
libpddokdo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/library.mk

stage::
	mkdir -p $(THEOS)/include/PeterDev
	cp -r ./public/* $(THEOS)/include/PeterDev
	cp $(THEOS_STAGING_DIR)/usr/lib/libpddokdo.dylib $(THEOS)/lib/libpddokdo.dylib

include $(THEOS_MAKE_PATH)/aggregate.mk