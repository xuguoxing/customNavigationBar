//
//  UIView+ViewController.m
//  CustomNavigationBar
//
//  Created by xuguoxing on 13-6-24.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

-(UIViewController*)viewController{
	UIResponder *responder = [self nextResponder];
	while (responder) {
		if ([responder isKindOfClass:[UIViewController class]]) {
			return (UIViewController*)responder;
		}
		responder = [responder nextResponder];
	}
	return nil;
}

@end
