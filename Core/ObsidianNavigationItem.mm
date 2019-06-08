#import "ObsidianNavigationItem.h"
#import "ObsidianCore.h"

@implementation ObsidianNavigationItem

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item {
    [self setLeftBarButtonItems:@[item]];
}

- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items {
    [super setLeftBarButtonItems:[(items ?: @[]) arrayByAddingObject:[ObsidianCore exportPackagesButton]]];
}

@end