//
//  SPColor+Exam.m
//  SPTheme_Example
//
//  Created by GheniAblez on 2023/8/18.
//  Copyright © 2023 sayiwen. All rights reserved.
//

#import "SPColor+Exam.h"

@implementation SPColor (Exam)

+ (SPTheme *)theme{
    return [SPTheme shareInstance];
}

+ (UIColor *)testColor{
    return [self.theme adaptColor:@"test"];
}


@end
