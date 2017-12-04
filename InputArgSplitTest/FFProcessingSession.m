//
//
//  transcode.m
//  transcode
//
//  Created by tangzhixin on 2017/11/18.
//  Copyright © 2017年 tangzhixin. All rights reserved.
//

#import "FFProcessingSession.h"
#import "FFCommand.h"

@implementation FFProcessingSession


+ (int) processWithCommand:(NSString *)command {
    return [FFCommand console:command];
}


@end

