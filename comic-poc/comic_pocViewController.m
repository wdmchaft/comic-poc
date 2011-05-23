//
//  comic_pocViewController.m
//  comic-poc
//
//  Created by nimbus on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "comic_pocViewController.h"

#define WIDTH 1024
#define HEIGHT 768

@implementation comic_pocViewController
@synthesize scrollView, imageViewA, imageViewB, imageViewC;

- (void)dealloc
{
    [super dealloc];
    [scrollView release];
    [imageViewA release];
    [imageViewB release];
    [imageViewC release];
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
    
    imageViewA = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-a.png"]];
    imageViewB = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-b.png"]];
    imageViewC = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"layer-c.png"]];
    
    imageViewA.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    imageViewB.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
    imageViewC.frame = CGRectMake(WIDTH * 2, 0, WIDTH, HEIGHT);
    
    imageViewA.userInteractionEnabled = YES;
    imageViewB.userInteractionEnabled = YES;
    imageViewC.userInteractionEnabled = YES;
    
    scrollView.contentSize = CGSizeMake(WIDTH * 3, HEIGHT);
    scrollView.maximumZoomScale = 4.0;
    scrollView.minimumZoomScale = 1.0;
    scrollView.clipsToBounds = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    
    scrollView.contentMode = (UIViewContentModeScaleAspectFit);
    scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    [scrollView insertSubview:imageViewA atIndex:0];
    [scrollView insertSubview:imageViewB atIndex:1];
    [scrollView insertSubview:imageViewC atIndex:2];
    
    scrollView.zoomScale = 1.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.scrollView = nil;
    self.imageViewA = nil;
    self.imageViewB = nil;
    self.imageViewC = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return scrollView;
}

- (IBAction) buttonAPressed:(id)sender {
    if (imageViewA.hidden) {
        imageViewA.hidden = NO;
    }
    else {
        imageViewA.hidden = YES;
    }
}

- (IBAction) buttonBPressed:(id)sender {
    if (imageViewB.hidden) {
        imageViewB.hidden = NO;
    }
    else {
        imageViewB.hidden = YES;
    }
}

- (IBAction) buttonCPressed:(id)sender {
    if (imageViewC.hidden) {
        imageViewC.hidden = NO;
    }
    else {
        imageViewC.hidden = YES;
    }
}

@end
