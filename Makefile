ARCHS = arm64 arm64e
TARGET = iphone:clang:latest

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libpddokdo
libpddokdo_FILES = libpddokdo.m
libpddokdo_FRAMEWORKS = UIKit
libpddokdo_LDFLAGS += -FFrameworks/
libpddokdo_CFLAGS = -fobjc-arc

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/library.mk
