//
//  LWViewController.m
//  RoundBackgroundLabel
//
//  Created by lee on 14-2-20.
//  Copyright (c) 2014年 LeeWong. All rights reserved.
//

#import "LWViewController.h"
#import "RoundBackgroundLabel.h"

@interface LWViewController ()
@property (weak, nonatomic) IBOutlet RoundBackgroundLabel *label1;
@property (weak, nonatomic) IBOutlet RoundBackgroundLabel *label2;
@property (weak, nonatomic) IBOutlet RoundBackgroundLabel *label3;
@property (weak, nonatomic) IBOutlet RoundBackgroundLabel *label4;

@end

@implementation LWViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.label1.text = @"round rect, no padding";
    self.label1.roundedBackgroundColor = [UIColor redColor];
    self.label1.radius = 5;
    self.label2.text = @"round rect label, 10 padding";
    self.label2.radius = 5;
    self.label2.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.label2.roundedBackgroundColor = [UIColor blueColor];
    self.label3.text = @"act as normal label, no padding";
    self.label3.roundedBackgroundColor = [UIColor yellowColor];
    self.label4.text = @"circle rect label, 10 padding";
    self.label4.radius = self.label4.frame.size.height/2;
    self.label4.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.label4.roundedBackgroundColor = [UIColor greenColor];
}

@end
