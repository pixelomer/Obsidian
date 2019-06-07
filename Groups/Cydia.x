#import "Groups.h"

@interface InstalledController : UIViewController
@end

%group ObsidianCydia
%hook InstalledController

- (void)viewDidLoad {
	%orig;
	self.navigationItem.leftBarButtonItem = [ObsidianCore exportPackagesButton];
}

%end
%end

void ObsidianInitializeCydia(void) {
	%init(ObsidianCydia);
}