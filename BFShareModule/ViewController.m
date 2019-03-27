//
//  ViewController.m
//  BFShareDemo
//
//  Created by 刘玲 on 2018/9/10.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "ViewController.h"
#import "BFSShareAssistant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)actionShareVideoBtn:(UIButton *)sender {
    
    [self shareTestVideo];
}

- (IBAction)actionSharePhotoBtn:(UIButton *)sender {
    
    [self shareTestPhoto];
}

#pragma mark - Share

- (void)shareTestVideo {
    
    NSString *pathVStr = [[NSBundle mainBundle] pathForResource:@"test_video.MOV" ofType:nil];
    [BFsShareAssistant shareResourcesByOS:@[pathVStr]
                                shareText:nil
                           fromController:self
                           andResultBlock:^(BOOL completed, NSString * _Nonnull resultMsg) {
        
        if (completed) {
            NSLog(@"分享成功");
        } else {
            NSLog(@"分享失败: %@", resultMsg);
        }
    }];
}

- (void)shareTestPhoto {
    
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"test_photo.jpg" ofType:nil];
    NSString *testTxt = @"系统分享文字";

    [BFsShareAssistant shareResourcesByOS:@[pathStr]
                                shareText:testTxt
                           fromController:self
                           andResultBlock:^(BOOL completed, NSString * _Nonnull resultMsg) {

        if (completed) {
            NSLog(@"分享成功");
        } else {
            NSLog(@"分享失败: %@", resultMsg);
        }
    }];
}

@end
