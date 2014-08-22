//
//  NSAttributedString+DVSTracking.h
//  TrackingAndCharacterSpacing
//
//  Created by Bryan Clark on 8/21/14.
//  Copyright (c) 2014 Starbucks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (DVSTracking)
+ (instancetype) dvs_attributedStringWithString:(NSString *)string
                                       tracking:(CGFloat)tracking
                                           font:(UIFont *)font;
@end
