//
//  BackgroundLabel.m
//
//  Created by lee on 14-2-15.
//  Copyright (c) 2014年 LeeWong. All rights reserved.

#import "RoundBackgroundLabel.h"

@implementation RoundBackgroundLabel

- (void)setInsets:(UIEdgeInsets)insets{
    _insets = insets;
    [self setNeedsDisplay];
}

- (void)setRadius:(float)radius{
    _radius = radius;
    [self setNeedsDisplay];
}

# pragma mark - add support for bounds

- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    CGRect rect = [super textRectForBounds:bounds
                    limitedToNumberOfLines:numberOfLines];
    rect.origin.x    -= self.insets.left;
    rect.origin.y    -= self.insets.top;
    rect.size.width  += (self.insets.left + self.insets.right);
    rect.size.height += (self.insets.top + self.insets.bottom);

    return rect;
}

# pragma mark - draw round rect background

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
	[self drawRoundedRect:context rect:rect radius:self.radius color:self.roundedBackgroundColor];
    [super drawRect:rect];
}

/**
 *  draw a rounded rect in specific position with radius
 *
 *  @param c             drawing context
 *  @param rect          where to draw
 *  @param corner_radius radius of the rect
 *  @param color         background color
 */
- (void)drawRoundedRect:(CGContextRef)c rect:(CGRect)rect radius:(int)corner_radius color:(UIColor *)color{
	int x_left = rect.origin.x;
	int x_left_center = rect.origin.x + corner_radius;
	int x_right_center = rect.origin.x + rect.size.width - corner_radius;
	int x_right = rect.origin.x + rect.size.width;
    
	int y_top = rect.origin.y;
	int y_top_center = rect.origin.y + corner_radius;
	int y_bottom_center = rect.origin.y + rect.size.height - corner_radius;
	int y_bottom = rect.origin.y + rect.size.height;
    
	/* Begin! */
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, x_left, y_top_center);
    
	/* First corner */
	CGContextAddArcToPoint(c, x_left, y_top, x_left_center, y_top, corner_radius);
	CGContextAddLineToPoint(c, x_right_center, y_top);
    
	/* Second corner */
	CGContextAddArcToPoint(c, x_right, y_top, x_right, y_top_center, corner_radius);
	CGContextAddLineToPoint(c, x_right, y_bottom_center);
    
	/* Third corner */
	CGContextAddArcToPoint(c, x_right, y_bottom, x_right_center, y_bottom, corner_radius);
	CGContextAddLineToPoint(c, x_left_center, y_bottom);
    
	/* Fourth corner */
	CGContextAddArcToPoint(c, x_left, y_bottom, x_left, y_bottom_center, corner_radius);
	CGContextAddLineToPoint(c, x_left, y_top_center);
    
	/* Done */
	CGContextClosePath(c);
    
	CGContextSetFillColorWithColor(c, color.CGColor);
    
	CGContextFillPath(c);
}

@end
