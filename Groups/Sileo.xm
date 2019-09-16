#import "Groups.h"
#import <objc/runtime.h>

extern "C" void ObsidianInitializeSileo(void) {
	ObsidianInitializeGenericApp(objc_getClass("PackageListViewController") ?: objc_getClass("Sileo.PackageListViewController"));
}