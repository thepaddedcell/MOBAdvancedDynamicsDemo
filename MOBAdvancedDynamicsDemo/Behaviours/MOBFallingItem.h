//
//  MOBFallingItem.h
//  MOBAdvancedDynamicsDemo
//
//  Created by Craig Stanford on 11/11/2013.
//  Copyright (c) 2013 Craig Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOBFallingItemDelegate;

@interface MOBFallingItem : NSObject <UIDynamicItem>

@property (nonatomic, weak) id<MOBFallingItemDelegate> delegate;

@property (nonatomic, readwrite) CGRect bounds;
@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readwrite) CGAffineTransform transform;

@end

@protocol MOBFallingItemDelegate <NSObject>

- (void)fallingItem:(MOBFallingItem*)item changedCenter:(CGPoint)center;

@end
