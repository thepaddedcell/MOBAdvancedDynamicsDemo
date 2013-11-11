//
//  MOBBouncyExpandViewController.m
//  MOBAdvancedDynamicsDemo
//
//  Created by Craig Stanford on 11/11/2013.
//  Copyright (c) 2013 Craig Stanford. All rights reserved.
//

#import "MOBBouncyExpandViewController.h"
#import "MOBFallingItem.h"

@interface MOBBouncyExpandViewController () <UIDynamicAnimatorDelegate, MOBFallingItemDelegate>

@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UIView* orangeView;
@property (nonatomic, strong) UIView* onScreenView;
@property (nonatomic, strong) UIView* offScreenView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* beginButton;

- (IBAction)startAnimating:(id)sender;

@end

@implementation MOBBouncyExpandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.orangeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 1)];
    self.orangeView.center = self.view.center;
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeView];
    
    self.offScreenView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.offScreenView];
    self.animator.delegate = self;
}

- (IBAction)startAnimating:(id)sender
{
    [self.animator removeAllBehaviors];
    
    MOBFallingItem* fallingItem = [[MOBFallingItem alloc] init];
    fallingItem.bounds = CGRectMake(0, 0, 10, 10);
    fallingItem.center = CGPointMake(10, 10);
    fallingItem.delegate = self;
    
    self.onScreenView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 10, 10)];
    self.onScreenView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.onScreenView];

    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[fallingItem]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];

    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[fallingItem]];
    gravity.magnitude = 2.f;
    [self.animator addBehavior:gravity];
    
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[fallingItem]];
    itemBehaviour.elasticity = 0.3f;
    itemBehaviour.density = 0.3f;
    
    [self.animator addBehavior:itemBehaviour];
}

#pragma mark - Falling Item Delegate

- (void)fallingItem:(MOBFallingItem *)item changedCenter:(CGPoint)center
{
    CGRect bounds = self.orangeView.bounds;
    bounds.size.width = center.y / 2;
    bounds.size.height = center.y / 4;
    self.orangeView.bounds = bounds;
    
    self.onScreenView.center = center;
}

#pragma mark - DynamicAnimator Delegate

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self.animator removeAllBehaviors];
    [self.onScreenView removeFromSuperview];
    self.beginButton.enabled = YES;
}

- (void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator
{
    self.beginButton.enabled = NO;
}

@end
