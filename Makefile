include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Obsidian

Obsidian_FILES = $(wildcard Groups/*.x) $(wildcard Core/*.m) Tweak.x
Obsidian_CFLAGS = -fobjc-arc -I. -include macros.h

include $(THEOS_MAKE_PATH)/tweak.mk
