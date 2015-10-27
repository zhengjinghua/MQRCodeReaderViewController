## 说明 
MQRCodeReaderViewController 是本人基于 [QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController) 封装的二维码扫描器, 其仿照微信的二维码扫描器的风格美化了界面.

## 修改内容
本人继承和拓展了原有的 `QRCodeReaderView`, 使其风格和微信一致.

## 截屏
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/qrcode_screenshot.gif)

## 安装

### CocoaPods 安装

将下面代码复制进你的 `Podfile` 文件中

``` bash
pod 'QRCodeReaderViewController', :git => 'https://github.com/zhengjinghua/MQRCodeReaderViewController.git'
```

### 手工安装

[下载](https://github.com/YannickL/QRCodeReaderViewController/archive/master.zip) 此项目, 然后将该项目里的 `QRCodeReaderViewController` 文件夹里的所有文件复制进你的项目中, 然后在需要调用此项目的地方引入 `#import "QRCodeReaderViewController.h"`.

## 使用

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





