## Thanks
Modify from [https://github.com/yannickl/QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController)
## screenshot
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/qrcode_screenshot.gif)

## Install

### CocoaPods
If you're using [CocoaPods](http://cocoapods.org/) (You are not?! You should!!) just add

``` bash
pod 'QRCodeReaderViewController', :git => 'https://github.com/zhengjinghua-ext-forks/QRCodeReaderViewController.git'
```
into your Podfile file.

### Manually

[Download](https://github.com/YannickL/QRCodeReaderViewController/archive/master.zip) the project and copy the `QRCodeReaderViewController` folder into your project and then simply `#import "QRCodeReaderViewController.h"` in the file(s) you would like to use it in.

## Usage

```objective-c
- (IBAction)scanAction:(id)sender
{
  NSArray *types = @[AVMetadataObjectTypeQRCode];
  _reader        = [QRCodeReaderViewController readerWithMetadataObjectTypes:types];
  
  // Set the presentation style
  _reader.modalPresentationStyle = UIModalPresentationFormSheet;
  
  // Using delegate methods
  _reader.delegate = self;
  
  // Or by using blocks
  [_reader setCompletionWithBlock:^(NSString *resultAsString) {
    [self dismissViewControllerAnimated:YES completion:^{
      NSLog(@"%@", resultAsString);
    }];
  }];
  
  [self presentViewController:_reader animated:YES completion:NULL];
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
  [self dismissViewControllerAnimated:YES completion:^{
    NSLog(@"%@", result);
  }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
  [self dismissViewControllerAnimated:YES completion:NULL];
}
```

*Note that you should check whether the device supports the reader library by using the `[QRCodeReader isAvailable]` or the `[QRCodeReader supportsMetadataObjectTypes:nil]` methods.*




