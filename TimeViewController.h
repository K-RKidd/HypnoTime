//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Krystle on 2/5/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
IBOutlet UILabel *timeLabel;
    
    __weak IBOutlet UIButton *timeButton;
}
-(IBAction)showCurrentTime:(id)sender;
-(void)spinTimeLabel;
-(void)bounceTimeLabel;
-(void)slideButton;

@end
