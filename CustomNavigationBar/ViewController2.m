//
//  ViewController2.m
//  CustomNavigationBar
//
//  Created by xuguoxing on 13-6-24.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "ViewController2.h"
#import "UINavigationBar+CustomBackground.h"
#import "UIView+ViewController.h"
#import "ViewController3.h"
#import "PresentViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2{
    UIImage *savedNavBarImage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"ViewController2";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    savedNavBarImage = [self.navigationController.navigationBar backgroundImage];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 100, 150, 40);
    [button setTitle:@"ViewController3" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(50, 150, 200, 40);
    [button2 setTitle:@"PresentViewController" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonPressed2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(50, 200, 150, 40);
    [button3 setTitle:@"PopToRoot" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonPressed3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
	// Do any additional setup after loading the view.
}

-(void)buttonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
    //ViewController3 *controller = [[ViewController3 alloc]init];
    //[self.navigationController pushViewController:controller animated:NO];
}

-(void)buttonPressed2:(id)sender
{
    PresentViewController *controller = [[PresentViewController alloc]init];
    [self presentModalViewController:controller animated:YES];
}

-(void)buttonPressed3:(id)sender
{
   
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BlackNavBar"]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    UINavigationController *navController = self.navigationController;
    //hack:ios5及之前版本在非动画方式pop时self.navigationController为nil,通过其他途径获取导航控制器
    if (!navController) {
        UIViewController *parentController = [self.view.superview viewController];
        if ([parentController isKindOfClass:[UINavigationController class]]) {
            navController = (UINavigationController*)parentController;
        }
    }
    
    NSUInteger index = [navController.viewControllers indexOfObject:self];
    if (index == NSNotFound || index == self.navigationController.viewControllers.count-2) {//pop 或者push
        [navController.navigationBar setBackgroundImage:savedNavBarImage];
    }
}

@end
