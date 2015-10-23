//
//  QRCodeReaderMaskView.m
//  QRCodeReaderViewControllerExample
//
//  Created by Jin on 9/24/15.
//  Copyright © 2015 Yannick Loriot. All rights reserved.
//

#import "QRCodeReaderMaskView.h"

@implementation QRCodeReaderMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return  self;
}

- (void)setup {
    self.alpha = 0.5;
    self.backgroundColor = [UIColor blackColor];
}

@end
