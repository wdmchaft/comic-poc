//
//  comic_pocViewController.m
//  comic-poc
//
//  Created by nimbus on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define SCREEN_WIDTH 1024
#define SCREEN_HEIGHT 768

#import "comic_pocViewController.h"


@implementation comic_pocViewController

- (void)dealloc
{
    [pageArray release];
    [scrollView release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PageView *page1 = [[PageView alloc] initWithBackLayer:[UIImage imageNamed:@"layer-a.png"] AndInkLayer:[UIImage imageNamed:@"layer-b.png"] AndSpeechLayer:[UIImage imageNamed:@"layer-c.png"]];
    
    PageView *page2 = [[PageView alloc] initWithBackLayer:[UIImage imageNamed:@"layer-a-2.png"] AndInkLayer:[UIImage imageNamed:@"layer-b.png"] AndSpeechLayer:[UIImage imageNamed:@"layer-c.png"]];
    
    PageView *page3 = [[PageView alloc] initWithBackLayer:[UIImage imageNamed:@"layer-a.png"] AndInkLayer:[UIImage imageNamed:@"layer-b-2.png"] AndSpeechLayer:[UIImage imageNamed:@"layer-c.png"]];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    scrollView.minimumZoomScale = 1.0f;
    scrollView.maximumZoomScale = 1.5f;
    scrollView.zoomScale = 1.0f;
    scrollView.clipsToBounds = YES;
    scrollView.scrollsToTop = NO;
    scrollView.scrollEnabled = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = YES; 
    scrollView.alwaysBounceVertical = YES;
    scrollView.alwaysBounceHorizontal = YES;
    scrollView.bouncesZoom = NO;
    scrollView.delegate = self;
    
    pageNum = 0;
    pageArray = [[NSArray alloc] initWithObjects:page1, page2, page3, nil];
    
    [page1 release];
    [page2 release];
    [page3 release];
    
    [scrollView addSubview:[pageArray objectAtIndex:pageNum]];
    [self.view insertSubview:scrollView atIndex:0];
    
    // swipe gestures
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(prevPage)];
    recognizer.delaysTouchesBegan = TRUE;
    [scrollView addGestureRecognizer: recognizer];
    [recognizer release];
     
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextPage)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [scrollView addGestureRecognizer: recognizer];
    [recognizer release];
    [scrollView delaysContentTouches];
}

- (void)scrollViewDidZoom:(UIScrollView *)view {
    if (view.zoomScale != 1.0) {
        // Zooming, disable scrolling
        view.scrollEnabled = TRUE;
    } else {
        // Not zoomed, let the scroll view scroll
        view.scrollEnabled = FALSE;
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)view {
    return [view.subviews objectAtIndex:0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    scrollView = nil;
    pageArray = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
    }
    
    return NO;
}

- (void) prevPage {
    if (pageNum > 0) {
        [UIView animateWithDuration:1.0 
                         animations:^ { 
                             [[pageArray objectAtIndex:pageNum] setAlpha:0.0];
                             [scrollView insertSubview:[pageArray objectAtIndex:(pageNum - 1)] atIndex:0];
                         }
                         completion:^(BOOL completed) {
                             if (completed) {
                                 [[pageArray objectAtIndex:pageNum] removeFromSuperview];
                                 [[pageArray objectAtIndex:pageNum] setAlpha:1.0];
                                 pageNum--;
                             }
                         }
         ];
    }
}

- (void) nextPage {
    if (pageNum < [pageArray count] - 1) {
        [UIView animateWithDuration:1.0 
                         animations:^ { 
                             [[pageArray objectAtIndex:pageNum] setAlpha:0.0];
                             [scrollView insertSubview:[pageArray objectAtIndex:(pageNum + 1)] atIndex:0];
                         }
                         completion:^(BOOL completed) {
                            if (completed) {
                                [[pageArray objectAtIndex:pageNum] removeFromSuperview];
                                [[pageArray objectAtIndex:pageNum] setAlpha:1.0];
                                pageNum++;
                             }
                         }
         ];
    }
}

- (IBAction) backToggle:(id)sender {
    [[pageArray objectAtIndex:pageNum] backToggle];
}

- (IBAction) inkToggle:(id)sender {
    [[pageArray objectAtIndex:pageNum] inkToggle];
}

- (IBAction) speechToggle:(id)sender {
    [[pageArray objectAtIndex:pageNum] speechToggle];
}

@end