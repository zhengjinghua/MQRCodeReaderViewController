<p align="center">
  <br>
  <b>创造不息，交付不止</b>
  <br>
  <a href="https://www.yousails.com">
    <img src="https://yousails.com/banners/brand.png" width=350>
  </a>
</p>

---

[English Guide](https://github.com/zhengjinghua/MQRCodeReaderViewController#readme-english)

## 说明 

MQRCodeReaderViewController 基于 [QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController) 封装的二维码扫描控件, 仿照微信的二维码扫描器风格美化了界面, 直接加入你的项目中就能使用, 无需再次定制 UI.

> Made with :heart: by [The EST Group](http://est-group.org) - We design and build: the Future!

![screenshot](http://7xnfdc.com1.z0.glb.clouddn.com/qrcode_screenshot.gif)

## 安装

### CocoaPods 安装

将下面代码复制进你的 `Podfile` 文件中

``` bash
pod 'QRCodeReaderViewController', :git => 'https://github.com/zhengjinghua/MQRCodeReaderViewController.git'
```

### 手工安装

[下载](https://github.com/YannickL/QRCodeReaderViewController/archive/master.zip) 此项目, 然后将该项目里的 `QRCodeReaderViewController` 文件夹里的所有文件复制进你的项目中, 然后在需要调用此项目的地方引入 

```objective-c
#import "QRCodeReaderViewController.h"
```

## 使用

支持以下两种方法调用, 选其一, 代码见下面: 

* 使用 Delegate 方法调用;
* 使用 Block 方法调用;

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


README (ENGLISH)
==========


## Description
This projecd baesd on [QRCodeReaderViewController](https://github.com/yannickl/QRCodeReaderViewController), a little UI ajustment from `QRCodeReaderView`, make the interface more like **WeChat**.

> Made with :heart: by [The EST Group](http://est-group.org) - We design and build: the Future!


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
