%ctor {
	void (*initAppSpecificHooks)(void) = MSFindSymbol(NULL, [NSString stringWithFormat:@"_ObsidianInitialize%@", NSProcessInfo.processInfo.processName].UTF8String);
	if (initAppSpecificHooks != NULL) {
		initAppSpecificHooks();
	}
}