//
//  NSFileManager+RL.h
//  RLDictionary
//
//  Created by younggi.lee on 06/03/2017.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NFFILE_SEPERATOR  @"/"

@interface NSFileManager (RL)

+ (NSString *)pathForCachesDirectory;
+ (NSString *)pathForDocumentDirectory;

@end