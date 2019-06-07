@interface ObsidianCore : NSObject {
    __kindof UIViewController * __weak targetViewController;
}
+ (void)setTargetViewController:(__kindof UIViewController *)vc;
+ (UIBarButtonItem *)exportPackagesButton;
@end