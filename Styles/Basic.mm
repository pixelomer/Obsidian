#import "Styles.h"
#import <substrate.h>
#import <objc/runtime.h>

void (*Obsidian$Basic$PackagesVC$viewDidLoad$orig)(id self, SEL _cmd);
void Obsidian$Basic$PackagesVC$viewDidLoad$hook(__kindof UIViewController *self, SEL _cmd) {
	Obsidian$Basic$PackagesVC$viewDidLoad$orig(self, _cmd);
	self.navigationItem.leftBarButtonItem = [ObsidianCore exportPackagesButton];
	ObsidianCore.targetViewController = self;
}

void ObsidianInitializeBasicApp(Class packagesViewControllerClass) {
	if (packagesViewControllerClass) {
		MSHookMessageEx(packagesViewControllerClass, @selector(viewDidLoad), (IMP)&Obsidian$Basic$PackagesVC$viewDidLoad$hook, (IMP *)&Obsidian$Basic$PackagesVC$viewDidLoad$orig);
	}
	else {
		@throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"The class cannot be null." userInfo:nil];
	}
}