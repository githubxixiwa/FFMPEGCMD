//
//  FFParamBuilder.m
//  IJKMediaFramework
//
//  Created by huade on 11/28/17.
//  Copyright © 2017 bilibili. All rights reserved.
//

#import "FFParamBuilder.h"

@implementation FFParamBuilder

- (NSString *)buildAudioReverseParam {
    NSString *commandBase = @"ffmpeg -i ";
    
    NSString *temp = @" -af areverse -y ";
    
    NSString *command = [NSString stringWithFormat:@"%@ \"%@\" %@ \"%@\"" , commandBase, self.inputPath, temp, self.outputPath];
    return command;
}

- (NSString *)buildTrancodeParam {
    NSString *commandBase = @"ffmpeg -i ";

    NSString *temp = @" -c:v libx264 -profile:v high -level 3.1 -x264-params scenecut=30:subme=2:trellis=1:keyint=30:min-keyint=30 -bf 3 -refs 4 -rc-lookahead 20 -crf 21 -qcomp 0.54 -deblock 0 -nr 400 -movflags faststart -use_editlist 0 -y ";

    NSString *command = [NSString stringWithFormat:@"%@ \"%@\" %@ %@" , commandBase, self.inputPath, temp, self.outputPath];
    return command;
}

@end
