//
//  NSString+ColorAttribute.h
//  Podic
//
//  Created by Andrew Lee on 21/09/2017.
//  Copyright © 2017 Andrew Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ColorAttribute)

- (NSMutableAttributedString *)attributedStringWithColor:(UIColor *)color inRange:(NSRange)range;
- (NSMutableAttributedString *)defaultColorAttributedString;

@end

@interface NSAttributedString (ColorAttribute)

- (NSMutableAttributedString *)attributedStringWithColor:(UIColor *)color inRange:(NSRange)range;
- (NSMutableAttributedString *)defaultColorAttributedString;

@end