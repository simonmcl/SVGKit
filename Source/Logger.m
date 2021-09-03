//
//  Logger.m
//  SVGKit-iOS
//
//  Created by Simon Mcloughlin on 03/09/2021.
//  Copyright © 2021 na. All rights reserved.
//

#import "Logger.h"
#import <os/log.h>

@implementation Logger

@synthesize loggingEnabled;

+ (id) shared {
	static Logger *sharedLogger = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedLogger = [[self alloc] init];
	});
	return sharedLogger;
}

- (id) init {
  if (self = [super init]) {
	  self.loggingEnabled = NO;
  }
  return self;
}



+ (NSString*) formatToString: frmt, ... {
	NSMutableString * res = [NSMutableString string];
	[res appendString:frmt];

	va_list args;
	va_start(args, frmt);
	id arg = nil;

	while(( arg = va_arg(args, id))){
		[res appendString:arg];
	}
	va_end(args);
	
	return res;
}




+ (void) logError: (NSString*) message {
	if ( [[Logger shared] loggingEnabled] ) {
		os_log_error(OS_LOG_DEFAULT, "%@", message);
	}
}

+ (void) logWarn: (NSString*) message {
	if ( [[Logger shared] loggingEnabled] ) {
		os_log_fault(OS_LOG_DEFAULT, "%@", message);
	}
}

+ (void) logInfo: (NSString*) message {
	if ( [[Logger shared] loggingEnabled] ) {
		os_log(OS_LOG_DEFAULT, "%@", message);
	}
}

+ (void) logDebug: (NSString*) message {
	if ( [[Logger shared] loggingEnabled] ) {
		os_log_debug(OS_LOG_DEFAULT, "%@", message);
	}
}

+ (void) logVerbose: (NSString*) message {
	if ( [[Logger shared] loggingEnabled] ) {
		os_log_info(OS_LOG_DEFAULT, "%@", message);
	}
}

@end
