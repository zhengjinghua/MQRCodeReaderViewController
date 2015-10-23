/*
 * QRCodeReaderViewController
 *
 * Copyright 2014-present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */


#import "QRCodeReaderView.h"
#import "QRCodeReaderMaskView.h"
#import "QRCodeReaderAanimationLineView.h"

#define DeviceWidth [UIScreen mainScreen].bounds.size.width
#define DeviceHeight [UIScreen mainScreen].bounds.size.height
#define DeviceFrame [UIScreen mainScreen].bounds

static const float CancelButtonHeight = 40;
static const float ReaderViewLengthRatio = 0.72;

@interface QRCodeReaderView ()
@property (nonatomic, strong) QRCodeReaderAanimationLineView *animationLine;
@property (nonatomic, strong) NSTimer *lineTimer;
@property (nonatomic) QRCodeReaderMaskView *maskView;

@property (nonatomic) float animationLineMaxY;
@property (nonatomic) float animationLineMinY;
@property (nonatomic) float readerViewSideLength;
@end

@implementation QRCodeReaderView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self initSettingValue];
        [self setOverlayPickerView];
    }
    
    return self;
}

- (void)initSettingValue {
    _readerViewSideLength = DeviceWidth * ReaderViewLengthRatio;
    _animationLineMinY = (DeviceHeight - 20  - _readerViewSideLength - CancelButtonHeight) / 2;
    _animationLineMaxY = _animationLineMinY + _readerViewSideLength;
}

- (QRCodeReaderAanimationLineView *)animationLine {
    if(_animationLine == nil) {
        _animationLine = [[QRCodeReaderAanimationLineView alloc] initWithFrame:CGRectMake((DeviceWidth - _readerViewSideLength) / 2, 0, _readerViewSideLength, 12 * self.readerViewSideLength / DeviceWidth) minY:self.animationLineMinY maxY:self.animationLineMaxY];
    }
    return _animationLine;
}

#pragma mark - Private Methods
- (void)setOverlayPickerView
{
    // Add line in the middle.
    [self addSubview:self.animationLine];
    
    // Add mask view
    UIView* maskTopView = [[QRCodeReaderMaskView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, self.animationLineMinY)];
    [self addSubview:maskTopView];
    
    UIView *maskLeftView = [[QRCodeReaderMaskView alloc] initWithFrame:CGRectMake(0, self.animationLineMinY, (DeviceWidth - self.readerViewSideLength) / 2.0, self.readerViewSideLength)];
    [self addSubview:maskLeftView];
    
    UIView *maskRightView = [[QRCodeReaderMaskView alloc] initWithFrame:CGRectMake(DeviceWidth - CGRectGetMaxX(maskLeftView.frame), self.animationLineMinY, CGRectGetMaxX(maskLeftView.frame), self.readerViewSideLength)];
    [self addSubview:maskRightView];
    
    CGFloat space_h = DeviceHeight - self.animationLineMaxY;
    
    UIView *maskBottomView = [[QRCodeReaderMaskView alloc] initWithFrame:CGRectMake(0, self.animationLineMaxY, DeviceWidth, space_h)];
    [self addSubview:maskBottomView];
    
    CGFloat scanCropViewWidth = DeviceWidth - 2 * CGRectGetMaxX(maskLeftView.frame) + 1;
    UIView *scanCropView = [[UIView alloc] initWithFrame:CGRectMake((DeviceWidth - scanCropViewWidth)/2, self.animationLineMinY-1.0, scanCropViewWidth, self.readerViewSideLength + 2)];
    scanCropView.layer.borderColor = [UIColor whiteColor].CGColor;
    scanCropView.layer.borderWidth = 1.0;
    [self addSubview:scanCropView];
    
    // Add cornet Image
    UIImage *cornerImage = [UIImage imageNamed:@"QRCodeTopLeft"];
    UIImageView *topLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(maskLeftView.frame) - 1.0, CGRectGetMaxY(maskTopView.frame) - 1.0, cornerImage.size.width, cornerImage.size.height)];
    topLeftImageView.image = cornerImage;
    [self addSubview:topLeftImageView];
    
    cornerImage = [UIImage imageNamed:@"QRCodeTopRight"];
    UIImageView *topRightImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(maskRightView.frame) - cornerImage.size.width + 1.0, CGRectGetMaxY(maskTopView.frame) - 1.0, cornerImage.size.width, cornerImage.size.height)];
    topRightImage.image = cornerImage;
    [self addSubview:topRightImage];
    
    cornerImage = [UIImage imageNamed:@"QRCodeBottomLeft"];
    UIImageView *bottomLeftImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(maskLeftView.frame) - 1.0, CGRectGetMinY(maskBottomView.frame) - cornerImage.size.height + 2.0, cornerImage.size.width, cornerImage.size.height)];
    bottomLeftImage.image = cornerImage;
    [self addSubview:bottomLeftImage];
    
    cornerImage = [UIImage imageNamed:@"QRCodeBottomRight"];
    UIImageView *bottomRightImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(maskRightView.frame) - cornerImage.size.width + 1.0, CGRectGetMinY(maskBottomView.frame) - cornerImage.size.height + 2.0, cornerImage.size.width, cornerImage.size.height)];
    bottomRightImage.image = cornerImage;
    [self addSubview:bottomRightImage];
    
    //说明label
    UILabel *labIntroudction = [[UILabel alloc] init];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.frame = CGRectMake(CGRectGetMaxX(maskLeftView.frame), CGRectGetMinY(maskBottomView.frame) + 25, self.readerViewSideLength, 20);
    labIntroudction.textAlignment = NSTextAlignmentCenter;
    labIntroudction.font = [UIFont boldSystemFontOfSize:13.0];
    labIntroudction.textColor = [UIColor whiteColor];
    labIntroudction.text = @"将二维码置于框内, 即可自动扫描";
    [self addSubview:labIntroudction];
    

}

- (void)startScanning
{
    _lineTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 50 target:self selector:@selector(animationForLine) userInfo:nil repeats:YES];
}

- (void)stopScanning
{
    if (_lineTimer)
    {
        [_lineTimer invalidate];
        _lineTimer = nil;
    }
    
}

- (void)animationForLine
{
    [self.animationLine startAnimation];
}

@end
