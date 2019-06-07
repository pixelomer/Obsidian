#include <substrate.h>

%ctor {
	NSString *symbol = [NSString stringWithFormat:@"_ObsidianInitialize%@", NSProcessInfo.processInfo.processName];
	void (*InitializeHooks)(void) = MSFindSymbol(NULL, symbol.UTF8String);
	if (InitializeHooks != NULL) {
		NSLog(@"%@()", symbol);
		InitializeHooks();
	}
	else {
		NSLog(@"Symbol not found: %@", symbol);
	}
}