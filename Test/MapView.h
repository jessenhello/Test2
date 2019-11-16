//
//  MapView.h
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MapViewDelegate <NSObject>
@optional
- (void)remakeFrame;

@end
@interface MapView : UIView
@property (nonatomic, weak)id<MapViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
