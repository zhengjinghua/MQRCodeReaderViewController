[中文见这里](https://github.com/zhengjinghua/MQRCodeReaderViewController#readme-chinese)

# MQRCodeReaderViewController
![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/qrcode_screenshot.gif)

## Description
This projecd baesd on [QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController). 

## Modified
I modified and expanded the `QRCodeReaderView`, make the interface become more like **WeChat**.


## Install

### CocoaPods
If you're using [CocoaPods](http://cocoapods.org/) (You are not?! You should!!) just add

``` bash
pod 'QRCodeReaderViewController', :git => 'https://github.com/zhengjinghua/MQRCodeReaderViewController.git'
```
into your Podfile file.

### Manually

[Download](https://github.com/zhengjinghua/MQRCodeReaderViewController/archive/master.zip) the project and copy the `QRCodeReaderViewController` folder into your project and then simply `#import "QRCodeReaderViewController.h"` in the file(s) you would like to use it in.

## Usage

```objective-c
- (IBAction)scanAction:(id)sender
{
	NSArray *types = @[AVMetadataObjectTypeQRCode];
  	_reader        = [QRCodeReaderViewController readerWithMetadataObjectTypes:types];
  
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

## License

StitchingImage is available under the MIT license. See the LICENSE file for more info.

---
README (Chinese)
==========

## 说明 
MQRCodeReaderViewController 是本人基于 [QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController) 封装的二维码扫描器, 其仿照微信的二维码扫描器的风格美化了界面.

## 修改内容
本人继承和拓展了原有的 `QRCodeReaderView`, 使其风格和微信一致.

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

## 协议

MQRCodeReaderViewController 被许可在 MIT 协议下使用. 查阅 LICENSE 文件来获得更多信息.


