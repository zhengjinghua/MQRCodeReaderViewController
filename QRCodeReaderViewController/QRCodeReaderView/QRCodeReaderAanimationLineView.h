//
//  QRCodeReaderAanimationLineView.h
//  QRCodeReaderViewControllerExample
//
//  Created by Jin on 9/24/15.
//  Copyright © 2015 Yannick Loriot. All rights reserved.
//

#import <UIKit/UIKit.h>

//static const float AnimationLineMinY = 185;
//static const float AnimationLineMaxY = 485;

@interface QRCodeReaderAanimationLineView : UIImageView

- (instancetype)initWithFrame:(CGRect)frame minY:(float)minY maxY:(float)maxY;
- (void)startAnimation;

@end
