//
//  FFCommand.m
//  InputArgSplitTest
//
//  Created by huade on 12/3/17.
//  Copyright © 2017 huade. All rights reserved.
//

#import "FFCommand.h"

@implementation FFCommand

char** str_split(char* a_str, const char a_delim, int *retCount)
{
    char** result = NULL;
    size_t count = 0;
    char* tmp = a_str;
    char* last_comma = NULL;
    char cNewDelim = ',';
    size_t idx  = 0;
    
    /* Count how many elements will be extracted. */
    int preDelim = 0;
    int iDQuoMkNum = 0;
    int iSQuoMkNum = 0;
    bool bNewParam = false;
    NSLog(@"ffmpeg command before:  %s", a_str);

    while (*tmp)
    {
        bNewParam = (0 == iDQuoMkNum % 2) && (0 == iSQuoMkNum % 2);
        if ('\"' == *tmp) {
            iDQuoMkNum ++;
        } else if ('\'' == *tmp) {
            iSQuoMkNum ++;
        } else if (a_delim == *tmp && bNewParam) {
            if (!preDelim) {
                count++;
                preDelim = 1;
                *tmp = cNewDelim; //replace with new delim ','
            }
            last_comma = tmp;
        } else {
            preDelim = 0;
        }
        tmp++;
    }
    
    //Add space for trailing token.
    count += last_comma < (a_str + strlen(a_str) - 1);

    /* Add space for terminating null string so caller
     knows where the list of returned strings ends. */
    result = malloc(sizeof(char*) * count);
    memset(result, 0, sizeof(char*) * count);

    if (result) {
        char* token = strtok(a_str, &cNewDelim);

        while (token) {
            *(result + idx++) = strdup(token);
            token = strtok(0, &cNewDelim);
        }
    }

    *retCount = (int)count;
    return result;
}


+ (BOOL) console:(NSString*) inParam {
    BOOL bRet = NO;
    char **outParam;
    int count;
    char* agrv = (char*)[inParam UTF8String];
    
    outParam = str_split(agrv, ' ', &count);
    
    NSLog(@"ffmpeg end\n");
    for(int i = 0; i<count; i++) {
        if (NULL != outParam[i]) {
            free( outParam[i]);
            outParam[i] = NULL;
        }
    }
    if (NULL != outParam) {
        free(outParam);
        outParam = NULL;
    }
    return bRet;
}
@end
