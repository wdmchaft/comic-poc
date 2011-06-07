//
//  PageView.m
//  comic-poc
//
//  Created by nimbus on 6/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PageView.h"


@implementation PageView

@synthesize backLayer, inkLayer, speechLayer;
/*
- (id)initWithFrame:(CGRect)rect {
    [super initWithFrame:rect];
    
    if (self) {
        self.frame = rect;
    }
    
    return self;
}
*/
- (id)initWithBackLayer:(UIImage*)back AndInkLayer:(UIImage*)ink AndSpeechLayer:(UIImage*)speech
{
    self = [super init];
    
    if (self) {
        backLayer = [[UIImageView alloc] initWithImage:back];
        inkLayer = [[UIImageView alloc] initWithImage:ink];
        speechLayer = [[UIImageView alloc] initWithImage:speech];
        
        self.frame = CGRectMake(0, 0, 1024, 768);
        
        [self insertSubview:backLayer atIndex:0];
        [self insertSubview:inkLayer atIndex:1];
        [self insertSubview:speechLayer atIndex:2];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [backLayer drawInRect:rect];
    [inkLayer drawInRect:rect];
    [speechLayer drawInRect:rect];
}
*/

- (void)backToggle {
    backLayer.hidden = !backLayer.hidden;
    [self setNeedsDisplay];
}

- (void)inkToggle {
    inkLayer.hidden = !inkLayer.hidden;
    [self setNeedsDisplay];
}

- (void)speechToggle {
    speechLayer.hidden = !speechLayer.hidden;
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [backLayer release];
    [inkLayer release];
    [speechLayer release];
    
    [super dealloc];
}

@end
