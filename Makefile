include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Obsidian

Obsidian_FILES = $(wildcard Groups/*.x) Tweak.x
Obsidian_CFLAGS = -fobjc-arc -I.

include $(THEOS_MAKE_PATH)/tweak.mk
