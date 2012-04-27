//
//  ImageScrollView.m
//  Wiki App
//
//  Created by Chloe Stars on 4/24/12.
//  Copyright (c) 2012 hachidorii@icloud.com. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    //////////////////////////////
    // Listen for Double Tap Zoom
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    
    [doubleTap setNumberOfTapsRequired:2];
    
    [self addGestureRecognizer:doubleTap];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {  
    
    if(self.zoomScale > self.minimumZoomScale)
        [self setZoomScale:self.minimumZoomScale animated:YES]; 
    else 
        [self setZoomScale:self.maximumZoomScale animated:YES]; 
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{ 
    UITouch *touch = [touches anyObject]; 
    CGPoint touch_point = [touch locationInView:self];
    CGPoint point; // = [touch locationInView:self.view];
    point.x = tileContainerView.center.x;
    point.y = tileContainerView.center.y;       
    
    if (![tileContainerView pointInside:[self convertPoint:touch_point toView: tileContainerView] withEvent:event]) {
        self.hidden = YES;
        // reset zoom
        CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 1.0);
        tileContainerView.transform = transform;
        [self setContentSize:CGSizeZero];
        NSLog(@"YES");
    } else {
        self.hidden = NO;
        NSLog(@"NO");
    }
    NSLog(@"image %.0f %.0f touch %.0f %.0f", tileContainerView.center.x, tileContainerView.center.y, point.x, point.y);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = tileContainerView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    tileContainerView.frame = frameToCenter;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
