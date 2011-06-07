//
//  comic_pocViewController.h
//  comic-poc
//
//  Created by nimbus on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageView.h"

@interface comic_pocViewController : UIViewController <UIScrollViewDelegate> {
    NSInteger pageNum;
    NSInteger pageCount;
    NSArray *pageArray;
    UIScrollView *scrollView;
}

@end