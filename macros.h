#ifndef __OBSIDIAN_MACROS_H
#define __OBSIDIAN_MACROS_H
#import <UIKit/UIKit.h>
#if DEBUG
#define NSLog(args...) NSLog(@"[Obsidian] "args)
#else
#define NSLog(...)
#endif
#endif