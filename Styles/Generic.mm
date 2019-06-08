#import "Styles.h"
#import <substrate.h>
#import <objc/runtime.h>

static bool didInitializeBefore;
static Class packagesViewControllerClass;
static __kindof UIViewController * __weak installedPackagesController;

void (*Obsidian$Generic$PackagesVC$viewWillAppear$orig)(id self, SEL _cmd, BOOL animated);
void Obsidian$Generic$PackagesVC$viewWillAppear$hook(id self, SEL _cmd, BOOL animated) {
	Obsidian$Generic$PackagesVC$viewWillAppear$orig(self, _cmd, animated);
	if (!installedPackagesController) {
		UITabBarController *tabBarController = (id)UIApplication.sharedApplication.keyWindow.rootViewController;
		for (UINavigationController *nc in tabBarController.viewControllers) {
			UIViewController *vc = nc.viewControllers.firstObject;
			NSLog(@"%@", vc);
			if (vc == self) {
				ObsidianCore.targetViewController = installedPackagesController = self;
				object_setClass(installedPackagesController.navigationItem, [ObsidianNavigationItem class]);
				[installedPackagesController.navigationItem setLeftBarButtonItems:installedPackagesController.navigationItem.rightBarButtonItems];
				break;
			}
		}
	}
}

void ObsidianInitializeGenericApp(Class _packagesViewControllerClass) {
	NSLog(@"ObsidianInitializeGenericApp(%@)", NSStringFromClass(_packagesViewControllerClass));
	if ((didInitializeBefore = !didInitializeBefore)) {
		if (_packagesViewControllerClass) {
			packagesViewControllerClass = _packagesViewControllerClass;
			MSHookMessageEx(packagesViewControllerClass, @selector(viewWillAppear:), (IMP)&Obsidian$Generic$PackagesVC$viewWillAppear$hook, (IMP *)&Obsidian$Generic$PackagesVC$viewWillAppear$orig);
		}
		else {
			@throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"The class cannot be null." userInfo:nil];
		}
	}
	else {
		@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Generic application cannot be initialized more than once." userInfo:nil];
	}
}