//
//  PageView.h
//  comic-poc
//
//  Created by nimbus on 6/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageView;

@interface PageView : UIView {    
}

@property (retain) UIImageView *backLayer;
@property (retain) UIImageView *inkLayer;
@property (retain) UIImageView *speechLayer;

-(id)initWithBackLayer:(UIImage*)back AndInkLayer:(UIImage*)ink AndSpeechLayer:(UIImage*)speech;
-(void)backToggle;
-(void)inkToggle;
-(void)speechToggle;

@end