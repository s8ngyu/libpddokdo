ARCHS = arm64 arm64e
TARGET = iphone:clang:11.4:11.4

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libpddokdo
libpddokdo_FILES = libpddokdo.m
libpddokdo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/library.mk

after-install::
	install.exec "killall -9 SpringBoard"