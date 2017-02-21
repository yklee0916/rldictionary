//
//  Word.h
//  RLDictionary
//
//  Created by younggi.lee on 21/02/2017.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Word
@end

@interface Word : JSONModel

@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSString *string;

- (instancetype)initWithString:(NSString *)string;

@end
