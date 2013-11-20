//
//  MOBCustomBehaviourViewController.m
//  MOBAdvancedDynamicsDemo
//
//  Created by Craig Stanford on 20/11/2013.
//  Copyright (c) 2013 Craig Stanford. All rights reserved.
//

#import "MOBCustomBehaviourViewController.h"
#import "MOBGravityCollisionBehaviour.h"

@interface MOBCustomBehaviourViewController ()

@property (nonatomic, strong) MOBGravityCollisionBehaviour* gravityCollisionBehaviour;
@property (nonatomic, strong) UIDynamicAnimator* animator;

@property (nonatomic, strong) IBOutlet UIView* redView;
@property (nonatomic, strong) IBOutlet UIView* blueView;

@end

@implementation MOBCustomBehaviourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravityCollisionBehaviour = [[MOBGravityCollisionBehaviour alloc] initWithItems:@[self.redView, self.blueView]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.animator addBehavior:self.gravityCollisionBehaviour];
}

@end
