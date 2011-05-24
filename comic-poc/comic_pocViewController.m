//
//  comic_pocViewController.m
//  comic-poc
//
//  Created by nimbus on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "comic_pocViewController.h"

@implementation comic_pocViewController

@synthesize pageArray, pageA, pageB, pageC, layerA, layerB, layerC;

- (void)dealloc
{
    [super dealloc];
    
    [self.pageArray dealloc];
    
    [pageA dealloc];
    [pageB dealloc];
    [pageC dealloc];
    
    [layerA dealloc];
    [layerB dealloc];
    [layerC dealloc];
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
    
    // initialize layers
    
    layerA = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-a.png"]];
    layerB = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-b.png"]];
    layerC = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-c.png"]];
    
    layerA.userInteractionEnabled = YES;
    layerB.userInteractionEnabled = YES;
    layerC.userInteractionEnabled = YES;
    
    // initialize pages
    
    pageA = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 1024)];
    pageB = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 1024)];
    pageC = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 1024)];
    
    pageA.backgroundColor = [UIColor redColor];
    pageB.backgroundColor = [UIColor blueColor];
    pageC.backgroundColor = [UIColor greenColor];
    
    pageA.maximumZoomScale = 1.0f; 
    pageA.maximumZoomScale = 4.0f; 
    pageA.zoomScale = 1.0f;
    
    pageB.maximumZoomScale = 1.0f; 
    pageB.maximumZoomScale = 4.0f; 
    pageB.zoomScale = 1.0f;
    
    pageC.maximumZoomScale = 1.0f; 
    pageC.maximumZoomScale = 4.0f; 
    pageC.zoomScale = 1.0f;
    
    pageA.clipsToBounds = NO; 
    pageA.scrollsToTop = NO; 
    pageA.delegate = self;
    
    
    pageB.clipsToBounds = NO; 
    pageB.scrollsToTop = NO; 
    pageB.delegate = self;
    
    pageC.clipsToBounds = NO; 
    pageC.scrollsToTop = NO; 
    pageC.delegate = self;
    
    pageA.showsHorizontalScrollIndicator = NO; 
    pageA.showsVerticalScrollIndicator = NO;
    pageB.showsHorizontalScrollIndicator = NO; 
    pageB.showsVerticalScrollIndicator = NO;
    pageC.showsHorizontalScrollIndicator = NO; 
    pageC.showsVerticalScrollIndicator = NO;
    
    pageA.decelerationRate = 0.5f; 
    pageB.decelerationRate = 0.5f; 
    pageC.decelerationRate = 0.5f;
    
    pageA.alwaysBounceVertical = YES; 
    pageA.alwaysBounceHorizontal = YES;
    pageB.alwaysBounceVertical = YES; 
    pageB.alwaysBounceHorizontal = YES;
    pageC.alwaysBounceVertical = YES; 
    pageC.alwaysBounceHorizontal = YES;
    
    pageA.bouncesZoom = NO; 
    pageB.bouncesZoom = NO; 
    pageC.bouncesZoom = NO;
    
    pageA.contentMode = (UIViewContentModeScaleAspectFit);
    pageB.contentMode = (UIViewContentModeScaleAspectFit); 
    pageC.contentMode = (UIViewContentModeScaleAspectFit);
    
    pageA.autoresizingMask = (UIViewAutoresizingFlexibleHeight);
    pageB.autoresizingMask = (UIViewAutoresizingFlexibleHeight);
    pageC.autoresizingMask = (UIViewAutoresizingFlexibleHeight);
    
    // paging stuff
    
    self.pageArray = [NSArray arrayWithObjects:pageA, pageB, pageC, nil];
    page = 0;
    
    [self.view insertSubview:[self.pageArray objectAtIndex:page] atIndex:0];
    
    [[self.pageArray objectAtIndex:page] insertSubview:layerA atIndex:0];
    [[self.pageArray objectAtIndex:page] insertSubview:layerB atIndex:1];
    [[self.pageArray objectAtIndex:page] insertSubview:layerC atIndex:2];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    pageA = nil;
    pageB = nil;
    pageC = nil;
    
    layerA = nil;
    layerB = nil;
    layerC = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (IBAction)prevPressed {
    if (page > 0) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        
        [[self.pageArray objectAtIndex:page] removeFromSuperview];
        [self.view insertSubview:[self.pageArray objectAtIndex:(page - 1)] atIndex:0];
        
        [UIView commitAnimations];
        
        // move content to prev page
        [[self.pageArray objectAtIndex:(page - 1)] insertSubview:layerA atIndex:0];
        [[self.pageArray objectAtIndex:(page - 1)] insertSubview:layerB atIndex:1];
        [[self.pageArray objectAtIndex:(page - 1)] insertSubview:layerC atIndex:2];
        
        page--;
    }
}

- (IBAction)nextPressed {
    if (page < [self.pageArray count] - 1) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        
        [[self.pageArray objectAtIndex:page] removeFromSuperview];
        [self.view insertSubview:[self.pageArray objectAtIndex:(page + 1)] atIndex:0];
        
        [UIView commitAnimations];
        
        // move content to next page
        [[self.pageArray objectAtIndex:(page + 1)] insertSubview:layerA atIndex:0];
        [[self.pageArray objectAtIndex:(page + 1)] insertSubview:layerB atIndex:1];
        [[self.pageArray objectAtIndex:(page + 1)] insertSubview:layerC atIndex:2];
    
        page++;
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.pageArray objectAtIndex:page];
}

- (IBAction) layerAToggle:(id)sender {
    if (layerA.hidden) {
        layerA.hidden = NO;
    }
    else {
        layerA.hidden = YES;
    }
}

- (IBAction) layerBToggle:(id)sender {
    if (layerB.hidden) {
        layerB.hidden = NO;
    }
    else {
        layerB.hidden = YES;
    }
}

- (IBAction) layerCToggle:(id)sender {
    if (layerC.hidden) {
        layerC.hidden = NO;
    }
    else {
        layerC.hidden = YES;
    }
}

@end
