//
//  NSAttributedString+DVSTracking.m
//  TrackingAndCharacterSpacing
//
//  Created by Bryan Clark on 8/21/14.
//  Copyright (c) 2014 Starbucks. All rights reserved.
//

#import "NSAttributedString+DVSTracking.h"

@implementation NSAttributedString (DVSTracking)

+ (instancetype) dvs_attributedStringWithString:(NSString *)string
                                       tracking:(CGFloat)tracking
                                           font:(UIFont *)font
{
    CGFloat fontSize = font.pointSize;
    CGFloat characterSpacing = tracking * fontSize / 1000;
    
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 NSKernAttributeName: [NSNumber numberWithFloat:characterSpacing]};
    
    return [[NSAttributedString alloc] initWithString:string attributes:attributes];
}

@end
