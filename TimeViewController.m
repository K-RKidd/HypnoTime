//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Krystle on 2/5/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
//set label for tab bar
UITabBarItem *tbi = [self tabBarItem];
[tbi setTitle:@ "Time"];

    [[self view] setBackgroundColor:[UIColor greenColor]];
    
    NSLog(@ "TimeViewController loaded it's view");
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@ "CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog(@ "CurrentTimeViewController will DISappear");
    [super viewWillDisappear:animated];
}


-(IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];

        [timeLabel setText:[formatter stringFromDate:now]];
}
@end
