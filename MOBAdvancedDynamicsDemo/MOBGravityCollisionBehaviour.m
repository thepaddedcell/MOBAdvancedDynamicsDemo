//
//  MOBGravityCollisionBehaviour.m
//  MOBAdvancedDynamicsDemo
//
//  Created by Craig Stanford on 20/11/2013.
//  Copyright (c) 2013 Craig Stanford. All rights reserved.
//

#import "MOBGravityCollisionBehaviour.h"

@interface MOBGravityCollisionBehaviour ()

@property (nonatomic, strong) UIGravityBehavior* gravityBehaviour;
@property (nonatomic, strong) UICollisionBehavior* collisionBehaviour;

@end

@implementation MOBGravityCollisionBehaviour

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:items];
        self.gravityBehaviour.magnitude = 0.5f;
        [self addChildBehavior:self.gravityBehaviour];
        
        self.collisionBehaviour = [[UICollisionBehavior alloc] initWithItems:items];
        self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = YES;
        [self addChildBehavior:self.collisionBehaviour];
    }
    return self;
}

@end
