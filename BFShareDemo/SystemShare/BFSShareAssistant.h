//
//  BFSShareAssistant.h
//  BFShareDemo
//
//  Created by 刘玲 on 2018/12/26.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFSShareAssistant : NSObject

#pragma mark - 系统分享

+ (void)shareResourcesByOS:(NSArray *)rPaths shareText:(NSString *)sText fromController:(UIViewController *)controller andResultBlock:(void(^)(BOOL completed, NSString *resultMsg))resultBlock;
//+ (void)shareResourcesByOS:(NSArray *)resourceArr andResultBlock:(void(^)(BOOL completed))resultBlock;

@end

NS_ASSUME_NONNULL_END
