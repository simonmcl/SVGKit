//
//  Logger.h
//  SVGKit-iOS
//
//  Created by Simon Mcloughlin on 03/09/2021.
//  Copyright © 2021 na. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <os/log.h>

NS_ASSUME_NONNULL_BEGIN

@interface Logger : NSObject

@property(nonatomic,readwrite) BOOL loggingEnabled;

+ (id) shared;

+ (NSString*) formatToString: frmt, ...;

+ (void) logError: (NSString*) message;
+ (void) logWarn: (NSString*) message;
+ (void) logInfo: (NSString*) message;
+ (void) logDebug: (NSString*) message;
+ (void) logVerbose: (NSString*) message;

@end

NS_ASSUME_NONNULL_END
