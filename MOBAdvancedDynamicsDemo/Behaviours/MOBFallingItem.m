//
//  MOBFallingItem.m
//  MOBAdvancedDynamicsDemo
//
//  Created by Craig Stanford on 11/11/2013.
//  Copyright (c) 2013 Craig Stanford. All rights reserved.
//

#import "MOBFallingItem.h"

@implementation MOBFallingItem

- (id)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([self.delegate respondsToSelector:@selector(fallingItem:changedCenter:)]) {
        [self.delegate fallingItem:self changedCenter:[change[@"new"] CGPointValue]];
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"center" context:nil];
}

@end
