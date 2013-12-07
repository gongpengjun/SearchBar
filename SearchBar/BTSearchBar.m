//
//  BTSearchBar.m
//  SearchBar
//
//  Created by 巩 鹏军 on 13-12-6.
//  Copyright (c) 2013年 巩 鹏军. All rights reserved.
//

#import "BTSearchBar.h"
#import "UIView+Subviews.h"

@interface UIView (debug)
- (NSString *)recursiveDescription;
@end

@implementation BTSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSLog(@"%s,%d\n%@",__FUNCTION__,__LINE__,[self recursiveDescription]);
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UITextField* textField = [self firstSubviewOfClass:NSClassFromString(@"UISearchBarTextField") maxDeepnessLevel:1];
    UIButton* cancelButton = [self firstSubviewOfClass:NSClassFromString(@"UINavigationButton") maxDeepnessLevel:1];
    BOOL cancelButtonVisible = cancelButton && !cancelButton.hidden;
    if(textField)
    {
        CGRect rect = textField.frame;
        rect.origin.x   = 15;
        rect.size.width = cancelButtonVisible ? 246 : 290;
        textField.frame = rect;
    }
    
    if(cancelButton)
    {
        [cancelButton setBackgroundImage:nil forState:UIControlStateNormal];
        [cancelButton setBackgroundImage:nil forState:UIControlStateHighlighted];
        [cancelButton setBackgroundImage:nil forState:UIControlStateDisabled];
        [cancelButton setBackgroundImage:nil forState:UIControlStateSelected];
        [cancelButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        CGPoint center = cancelButton.center;
        center.x = CGRectGetMaxX(textField.frame) + (320.0 - CGRectGetMaxX(textField.frame))/2.0;
        cancelButton.center = center;
    }

    //NSLog(@"%s,%d\n%@",__FUNCTION__,__LINE__,[self recursiveDescription]);
}

@end
