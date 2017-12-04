//
//  FFParamBuilder.h
//  IJKMediaFramework
//
//  Created by huade on 11/28/17.
//  Copyright © 2017 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFParamBuilder : NSObject

@property (nonatomic, strong) NSString *inputPath;
@property (nonatomic, strong) NSString *outputPath;

- (NSString *)buildTrancodeParam;
- (NSString *)buildAudioReverseParam;

@end
