//
//  QRCodeReaderAanimationLineView.m
//  QRCodeReaderViewControllerExample
//
//  Created by Jin on 9/24/15.
//  Copyright © 2015 Yannick Loriot. All rights reserved.
//

#import "QRCodeReaderAanimationLineView.h"

@interface QRCodeReaderAanimationLineView ()
@property (nonatomic) float minY;
@property (nonatomic) float maxY;
@end

@implementation QRCodeReaderAanimationLineView

- (instancetype)initWithFrame:(CGRect)frame minY:(float)minY maxY:(float)maxY {
    if (self = [super initWithFrame:frame]) {
        _minY = minY;
        _maxY = maxY;
        [self setup];
    }
    
    return  self;
}

- (void)setup {
    self.image = [UIImage imageNamed:@"QRCodeLine"];
}

- (void)startAnimation
{
    __block CGRect frame = self.frame;
    
    static BOOL flag = YES;
    
    if (flag)
    {
        frame.origin.y = self.minY;
        flag = NO;
        
        [UIView animateWithDuration:1.0 / 50 animations:^{
            
            frame.origin.y += 2;
            self.frame = frame;
            
        } completion:nil];
    }
    else
    {
        if (self.frame.origin.y >= self.minY)
        {
            if (self.frame.origin.y >= self.maxY - 12)
            {
                frame.origin.y = self.minY;
                self.frame = frame;
                
                flag = YES;
            }
            else
            {
                [UIView animateWithDuration:1.0 / 50 animations:^{
                    
                    frame.origin.y += 2;
                    self.frame = frame;
                    
                } completion:nil];
            }
        }
        else
        {
            flag = !flag;
        }
    }
    
}


@end
