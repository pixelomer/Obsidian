#import "Core.h"

@implementation ObsidianCore

static ObsidianCore *sharedInstance;

+ (void)load {
	if ([self class] == [ObsidianCore class]) {
		sharedInstance = nil;
	}
}

+ (instancetype)alloc {
	return nil;
}

+ (instancetype)sharedInstance {
	return sharedInstance = (sharedInstance ?: [[super alloc] init]);
}

- (void)handleExportButton {
	@throw [NSException exceptionWithName:NSGenericException reason:@"Not implemented" userInfo:nil];
}

+ (UIBarButtonItem *)exportPackagesButton {
	UIBarButtonItem *button = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemAction
		target:self.sharedInstance
		action:@selector(handleExportButton)
	];
	return button;
}


@end