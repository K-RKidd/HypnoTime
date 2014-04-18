//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Krystle on 2/5/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"


@implementation HypnosisViewController
-(void) loadView
{
    //Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    //Set it as *the* view of this view controller
    [self setView:v];
    
    // set label for tab bar
    UITabBarItem *tbi = [self tabBarItem];
    [tbi setTitle:@ "Hypnosis"];

}
-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@ "HypnosisViewController loaded it's view");
}

@end
