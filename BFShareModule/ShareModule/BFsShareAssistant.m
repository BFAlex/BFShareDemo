//
//  BFSShareAssistant.m
//  BFShareDemo
//
//  Created by 刘玲 on 2018/12/26.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "BFsShareAssistant.h"

@implementation BFsShareAssistant

+ (void)shareResourcesByOS:(NSArray *)rPaths shareText:(nonnull NSString *)sText fromController:(nonnull UIViewController *)controller andResultBlock:(nonnull void (^)(BOOL, NSString *))resultBlock {
    
    NSMutableArray *activityItems = [NSMutableArray array];
    // share files
    NSURL *itemPath;
    for (NSString *path in rPaths) {
        if ([path hasPrefix:@"http"]) {
            itemPath = [self urlFromNetworkResourcePathStr:path];
        } else {
            itemPath = [self urlFromLocalResourcePathStr:path];
        }
        
        [activityItems addObject:itemPath];
    }
    // share text
    if (sText.length > 0) {
        [activityItems addObject:sText];
    }
    
    if (activityItems.count < 1 && resultBlock) {
        resultBlock(false, @"no data to share");
        return;
    }
    
    [self shareResources:activityItems fromController:controller andResultBlock:resultBlock];
}

#pragma mark - Private

+ (NSURL *)urlFromLocalResourcePathStr:(NSString *)pathStr {
    
    NSURL *pathUrl = [NSURL fileURLWithPath:pathStr];
    return pathUrl;
}

+ (NSURL *)urlFromNetworkResourcePathStr:(NSString *)pathStr {
    
    NSURL *pathUrl = [NSURL URLWithString:pathStr];
    return pathUrl;
}

+ (void)shareResources:(NSArray *)activityItems fromController:(nonnull UIViewController *)controller andResultBlock:(void(^)(BOOL, NSString*))result {
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    
    [controller presentViewController:activityVC animated:YES completion:^{
        activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
            
            if (result) {
                result(completed, activityError.localizedDescription);
            }
        };
    }];
}

@end
