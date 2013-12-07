//
//  UIView+Subviews.h
//  SearchBar
//
//  Created by 巩 鹏军 on 13-12-7.
//  Copyright (c) 2013年 巩 鹏军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Subviews)

/**
 *	Recursively search for and return a view of a given class in the subviews hierarchy of the receiver
 *  searching for it at 3 level max deepness.
 *
 *	@param	clazz	The given class.
 *
 *	@return	The first view of a given class found in the subviews hierarchy.
 */
- (id)firstSubviewOfClass:(Class)clazz;

/**
 *	Recursively search for and return a view of a given class in the subviews hierarchy of the receiver.
 *
 *	@param	clazz	The given class.
 *	@param	deepness	The max level of recursion.
 *
 *	@return	The first view of a given class found in the subviews hierarchy.
 */
- (id)firstSubviewOfClass:(Class)clazz maxDeepnessLevel:(NSInteger)deepness;

@end
