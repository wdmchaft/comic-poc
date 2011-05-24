//
//  comic_pocViewController.h
//  comic-poc
//
//  Created by nimbus on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface comic_pocViewController : UIViewController {
    NSInteger page;
    NSInteger pageCount;
}

@property (nonatomic, retain) NSArray *pageArray;

@property (nonatomic, retain) UIScrollView *pageA;
@property (nonatomic, retain) UIScrollView *pageB;
@property (nonatomic, retain) UIScrollView *pageC;

@property (nonatomic, retain) UIImageView *layerA;
@property (nonatomic, retain) UIImageView *layerB;
@property (nonatomic, retain) UIImageView *layerC;

@end