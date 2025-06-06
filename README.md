# YJDLNA

[![CI Status](https://img.shields.io/travis/yangjian/YJDLNA.svg?style=flat)](https://travis-ci.org/yangjian/YJDLNA)
[![Version](https://img.shields.io/cocoapods/v/YJDLNA.svg?style=flat)](https://cocoapods.org/pods/YJDLNA)
[![License](https://img.shields.io/cocoapods/l/YJDLNA.svg?style=flat)](https://cocoapods.org/pods/YJDLNA)
[![Platform](https://img.shields.io/cocoapods/p/YJDLNA.svg?style=flat)](https://cocoapods.org/pods/YJDLNA)

# Dependencies

- iOS DLNA Function 
- iOS DLNA 投屏功能, 支持各大主流电视盒子(小米,华为,乐视,移动魔百盒等), 可以播放,暂停,快进退,调音量,退出.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

# Usage

YJDLNA is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YJDLNA'
```
- Search Devices

```
<DLNADelegate>

- (void)searchDLNAResult:(NSArray *)devicesArray{
    NSLog(@"Find devices");
    //self.deviceArr = devicesArray;
    //[self.dlnaTable reloadData];
}

- (void)dlnaStartPlay{
    NSLog(@"DLNA Success Start Play");
}


```

- Play Control

```
@property(nonatomic,strong) YJDLNA *dlnaManager;

#pragma mark -Play Control

/**
 Quit
 */
- (IBAction)closeAction:(id)sender {
    [self.dlnaManager endDLNA];
}


/**
 Play/Pause
 */
- (IBAction)playOrPause:(id)sender {
    if (_isPlaying) {
        [self.dlnaManager dlnaPause];
    }else{
        [self.dlnaManager dlnaPlay];
    }
    _isPlaying = !_isPlaying;
}


/**
 SeekChange
 */
- (IBAction)seekChanged:(UISlider *)sender{
    NSInteger sec = sender.value * 60 * 60;
    NSLog(@"播放进度条======>: %zd",sec);
    [self.dlnaManager seekChanged:sec];
}

/**
 VolumeChange
 */
- (IBAction)volumeChange:(UISlider *)sender {
    NSString *vol = [NSString stringWithFormat:@"%.f",sender.value * 100];
    NSLog(@"音量========>: %@",vol);
    [self.dlnaManager volumeChanged:vol];
}


/**
 PlayNextMovie
 */
- (IBAction)playNext:(id)sender {
    NSString *testVideo = @"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4";
    [self.dlnaManager playTheURL:testVideo];
}
```

# For more information please see demo

## Author

yangjian, 971175049@qq.com

## License

YJDLNA is available under the MIT license. See the LICENSE file for more info.
