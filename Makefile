ARCHS = armv7 arm64 arm64e
TARGET = iphone::6.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Obsidian

Obsidian_FILES = $(wildcard */*.xm) $(wildcard */*.mm) Tweak.xm
Obsidian_CFLAGS = -fobjc-arc -I. -include macros.h

include $(THEOS_MAKE_PATH)/tweak.mk