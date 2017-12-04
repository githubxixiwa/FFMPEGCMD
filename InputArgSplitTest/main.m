//
//  main.m
//  InputArgSplitTest
//
//  Created by huade on 12/3/17.
//  Copyright © 2017 huade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFCommand.h"
#import "FFParamBuilder.h"
#import "FFProcessingSession.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    //NSString * inFile1 = [[self applicationDocumentsDirectory] stringByAppendingString:@"/in.wav"];
    //NSString * outFile1 = [[self applicationDocumentsDirectory] stringByAppendingString:@"/output_reverse.wav"];
    NSString * inFile1 = @"/in    test.wav";
    NSString * outFile1 = @"/output_reverse.wav";
    FFParamBuilder *paramBuilder = [[FFParamBuilder alloc] init];
    paramBuilder.inputPath = inFile1;
    paramBuilder.outputPath = outFile1;
    
    NSString *command = [paramBuilder buildAudioReverseParam];
    NSLog(@"command is %@", command);
    
    [FFProcessingSession processWithCommand:command];
    
    return 0;
}
