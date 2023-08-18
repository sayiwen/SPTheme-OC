//
//  SPFont.m
//  Pods-SPTheme_Example
//
//  Created by GheniAblez on 2023/8/18.
//

#import "SPFont.h"
#import "SPTheme.h"

@implementation SPFont

+ (SPTheme *)theme{
    return [SPTheme shareInstance];
}

+ (UIFont *)largeTitle{
    return [self.theme adaptSize:@"largeTitle"];
}

+ (UIFont *)title{
    return [self.theme adaptSize:@"title"];
}

+ (UIFont *)subtitle{
    return [self.theme adaptSize:@"subtitle"];
}

+ (UIFont *)body{
    return [self.theme adaptSize:@"body"];
}

+ (UIFont *)smallBody{
    return [self.theme adaptSize:@"smallBody"];
}

+ (UIFont *)caption{
    return [self.theme adaptSize:@"caption"];
}

@end
