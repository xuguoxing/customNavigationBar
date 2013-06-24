//
//  UINavigationBar+CustomBackground.m
//  CustomNavigationBar
//
//  Created by xuguoxing on 13-6-24.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "UINavigationBar+CustomBackground.h"
#import <objc/runtime.h>
static char backgroundImageKey;

@implementation UINavigationBar (CustomBackground)

// iOS5 之前的版本调用
- (void)drawRect:(CGRect)rect {
    UIImage *image = objc_getAssociatedObject(self, &backgroundImageKey);
    if (!image) {
        image = [UIImage imageNamed:@"NavBar"];
        objc_setAssociatedObject(self, &backgroundImageKey, image, OBJC_ASSOCIATION_RETAIN);
    }
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    return;
}

-(void)setBackgroundImage:(UIImage *)backgroundImage;
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    }else{
        objc_setAssociatedObject(self, &backgroundImageKey, backgroundImage, OBJC_ASSOCIATION_RETAIN);
        [self setNeedsDisplay];
    }
}

-(UIImage*)backgroundImage
{
    if ([self respondsToSelector:@selector(backgroundImageForBarMetrics:)]) {
        return [self backgroundImageForBarMetrics:UIBarMetricsDefault];
    }else{
        return objc_getAssociatedObject(self, &backgroundImageKey);
    }
}

@end
