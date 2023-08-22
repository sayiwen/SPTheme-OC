//
//  SPColor.m
//  SPTheme
//
//  Created by GheniAblez on 2023/8/18.
//

#import "SPColor.h"
#import "SPTheme.h"

@implementation SPColor

+ (SPTheme *)theme{
    return [SPTheme shareInstance];
}

+ (UIColor *)primary{
    return [self.theme adaptColor:@"primary"];
}

+ (UIColor *)second{
    return [self.theme adaptColor:@"second"];
}

+ (UIColor *)text{
    return [self.theme adaptColor:@"text"];
}

+ (UIColor *)secondText{
    return [self.theme adaptColor:@"secondText"];
}

+ (UIColor *)background{
    return [self.theme adaptColor:@"background"];
}

+ (UIColor *)secondBackground{
    return [self.theme adaptColor:@"secondBackground"];
}

//borderColor
+ (UIColor *)border{
    return [self.theme adaptColor:@"border"];
}

//dangerColor
+ (UIColor *)danger{
    return [self.theme adaptColor:@"danger"];
}

//successColor
+ (UIColor *)success{
    return [self.theme adaptColor:@"success"];
}

//warningColor
+ (UIColor *)warning{
    return [self.theme adaptColor:@"warning"];
}

//info
+ (UIColor *)info{
    return [self.theme adaptColor:@"info"];
}


//white
+ (UIColor *)white{
    return [UIColor whiteColor];
}

@end
