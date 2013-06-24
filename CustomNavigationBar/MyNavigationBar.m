//
//  MyNavigationBar.m
//  CustomNavigationBar
//
//  Created by xuguoxing on 13-6-24.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBar

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];    
    UIImage *image = [UIImage imageNamed:@"NavBar"];
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
}

@end
