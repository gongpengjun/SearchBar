//
//  UIView+Subviews.m
//  SearchBar
//
//  Created by 巩 鹏军 on 13-12-7.
//  Copyright (c) 2013年 巩 鹏军. All rights reserved.
//

#import "UIView+Subviews.h"

@implementation UIView (Subviews)

- (id)firstSubviewOfClass:(Class)clazz
{
    return [self firstSubviewOfClass:clazz maxDeepnessLevel:3];
}

- (id)firstSubviewOfClass:(Class)clazz maxDeepnessLevel:(NSInteger)deepness
{
    if (deepness == 0) {
        return nil;
    }
    
    NSInteger count = deepness;
    
    NSArray *subviews = self.subviews;
    
    while (count > 0) {
        for (UIView *v in subviews) {
            if ([v isKindOfClass:clazz]) {
                return v;
            }
        }
        
        count--;
        
        for (UIView *v in subviews) {
            UIView *retVal = [v firstSubviewOfClass:clazz maxDeepnessLevel:count];
            if (retVal) {
                return retVal;
            }
        }
    }
    
    return nil;
}

@end
