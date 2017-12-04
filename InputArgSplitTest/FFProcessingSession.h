//
//  transcode.h
//  transcode
//
//  Created by tangzhixin on 2017/11/18.
//  Copyright © 2017年 tangzhixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFProcessingSession : NSObject

+ (int) processWithCommand:(NSString *)command;

@end
