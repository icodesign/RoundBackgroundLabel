//
//  BackgroundLabel.h
//
//  Created by lee on 14-2-15.
//  Copyright (c) 2014年 LeeWong. All rights reserved.

/**
 *
 *  This is Custom UILabel with rounded rect background supporting insets(padding)
 *  and sizetofit.
 */

#import <UIKit/UIKit.h>

@interface RoundBackgroundLabel : UILabel

/**
 *  label's padding
 */
@property (nonatomic) UIEdgeInsets insets;

/**
 *  background round rect radius
 */
@property (nonatomic) float radius;

@property (strong,nonatomic) UIColor *roundedBackgroundColor;

@end
