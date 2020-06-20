//
//  ViewController.m
//  PPPlayer
//
//  Created by FaiWong on 2020/6/20.
//  Copyright © 2020 ab. All rights reserved.
//

#import "ViewController.h"
#import <PLPlayerKit/PLPlayerKit.h>
@interface ViewController ()<PLPlayerDelegate>
@property (nonatomic, strong) PLPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    // 初始化 PLPlayerOption 对象
    PLPlayerOption *option = [PLPlayerOption defaultOption];

    // 更改需要修改的 option 属性键所对应的值
    [option setOptionValue:@15 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    [option setOptionValue:@2000 forKey:PLPlayerOptionKeyMaxL1BufferDuration];
    [option setOptionValue:@1000 forKey:PLPlayerOptionKeyMaxL2BufferDuration];
    [option setOptionValue:@(NO) forKey:PLPlayerOptionKeyVideoToolbox];
    [option setOptionValue:@(kPLLogInfo) forKey:PLPlayerOptionKeyLogLevel];
    
    // 初始化 PLPlayer
    self.player = [PLPlayer playerWithURL:[NSURL URLWithString:@"http://111.13.111.242/otttv.bj.chinamobile.com/PLTV/88888888/224/3221226226/1.m3u8"] option:option];

    // 设定代理 (optional)
    self.player.delegate = self;
    self.player.playerView.frame = self.view.bounds;
    self.player.playerView.contentMode = UIViewContentModeScaleAspectFit;
    //获取视频输出视图并添加为到当前 UIView 对象的 Subview
    [self.view addSubview:self.player.playerView];
    [self.player play];
}

- (void)player:(nonnull PLPlayer *)player firstRender:(PLPlayerFirstRenderType)firstRenderType {
    
}

@end
