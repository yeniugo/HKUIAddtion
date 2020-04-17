//
//  NSString+CommonCrypto.m
//  PodTest
//
//  Created by hukai on 2020/4/17.
//  Copyright © 2020 hukai. All rights reserved.
//

#import "NSString+CommonCrypto.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (CommonCrypto)
- (NSString *)SHA256{
    const char *s = [self cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *out = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash = [out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}
@end
