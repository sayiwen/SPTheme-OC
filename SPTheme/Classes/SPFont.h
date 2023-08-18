//
//  SPFont.h
//  Pods-SPTheme_Example
//
//  Created by GheniAblez on 2023/8/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPFont : NSObject

//large title
+ (UIFont *)largeTitle;
//title
+ (UIFont *)title;
//subtitle
+ (UIFont *)subtitle;
//body
+ (UIFont *)body;
//small body
+ (UIFont *)smallBody;
//caption
+ (UIFont *)caption;

@end

NS_ASSUME_NONNULL_END
