//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Krystle on 2/5/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "TimeViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation TimeViewController

-(id) init{
    self= [super init];
    if (self){
        //set label for tab bar
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@ "Time"];
    }
    return self;
}

-(void) viewDidLoad
{
    [super viewDidLoad];

    [[self view] setBackgroundColor:[UIColor greenColor]];
    [self slideButton];
    
    NSLog(@ "TimeViewController loaded it's view");
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@ "CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
    [self slideButton];
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
    //[self spinTimeLabel];
    [self bounceTimeLabel];
    
}
-(void)spinTimeLabel{
    //Create basic animation
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    [spin setDelegate:self];
    
    //fromValue is implied
    [spin setToValue:[NSNumber numberWithFloat:M_PI *2.0]];
    [spin setDuration:1.0];
    
    //Set the timing function
    CAMediaTimingFunction *tf = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [spin setTimingFunction:tf];
    
    //Kick off the animation by adding it to the layer
    [[timeLabel layer]addAnimation:spin forKey:@"spinAnimation"];
    
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@" %@ finished: %d", anim, flag);
    
}
-(void)bounceTimeLabel{
    //Create a key frame animation
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    //Create the values it will pass through
    CATransform3D forward = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back = CATransform3DMakeScale(0.7, 0.7, 1);
    CATransform3D forward2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D back2 = CATransform3DMakeScale(0.9, 0.9, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity], [NSValue valueWithCATransform3D:forward], [NSValue valueWithCATransform3D:back], [NSValue valueWithCATransform3D:forward2], [NSValue valueWithCATransform3D:back2], [NSValue valueWithCATransform3D:CATransform3DIdentity], nil]];
    //Set the duration
    [bounce setDuration:1.0];
    
    CAKeyframeAnimation *fade = [CAKeyframeAnimation animationWithKeyPath:@"fade"];
    NSMutableArray *value = [NSMutableArray array];
    [value addObject:[NSNumber numberWithFloat:1]];
    [value addObject:[NSNumber numberWithFloat:900]];
    [value addObject:[NSNumber numberWithFloat:.05]];
    [value addObject:[NSNumber numberWithFloat:700]];
    [value addObject:[NSNumber numberWithFloat:.03]];
    [value addObject:[NSNumber numberWithFloat:1]];
    
    [fade setValues:value];
    [fade setDuration:[bounce duration]];

    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:bounce, fade, nil]];
    [[timeLabel layer] addAnimation:group forKey:@"animations"];
    
    //Animate the layer
    //[[timeLabel layer] addAnimation:bounce forKey:@"bounceAnimation"];
   
    
}
- (void)slideButton
{
    CABasicAnimation *slide = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [slide setDuration:1.0];
    [slide setFromValue:[NSNumber numberWithFloat:-[[timeButton layer] position].x]];
    [slide setToValue:[NSNumber numberWithFloat:0.0]];
    [[timeButton layer] addAnimation:slide forKey:@"slidet"];
}



@end
