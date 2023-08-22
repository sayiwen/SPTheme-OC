//
//  SPColor.h
//  SPTheme
//
//  Created by GheniAblez on 2023/8/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPColor : NSObject
+ (UIColor *)primary;
+ (UIColor *)second;
+ (UIColor *)text;
+ (UIColor *)secondText;
+ (UIColor *)background;
+ (UIColor *)secondBackground;
+ (UIColor *)border;
+ (UIColor *)danger;
+ (UIColor *)success;
+ (UIColor *)warning;
+ (UIColor *)info;
+ (UIColor *)white;
@end

NS_ASSUME_NONNULL_END
