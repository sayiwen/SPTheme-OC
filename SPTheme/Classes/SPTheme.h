//
//  SPTheme.h
//  SPTheme
//
//  Created by GheniAblez on 2023/8/18.
//

#import <Foundation/Foundation.h>
#import "SPFont.h"
#import "SPColor.h"

NS_ASSUME_NONNULL_BEGIN

#define SPString(key) [[SPTheme shareInstance] adaptString:key]

@interface SPTheme : NSObject

//share instance
+ (instancetype)shareInstance;

+ (NSTextAlignment)getTextAlignment;

+ (NSWritingDirection)getWritingDirection;

+ (UISemanticContentAttribute)getSemanticContentAttribute;

@property (nonatomic, assign) BOOL isRTL;

@property (nonatomic, strong) NSString *lightTheme;

@property (nonatomic, strong) NSString *darkTheme;

@property (nonatomic, strong) NSString *fontFamily;

- (UIColor *)adaptColor:(NSString *)key;

- (UIFont *)adaptSize:(NSString *)key;

- (NSString *)adaptString:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
