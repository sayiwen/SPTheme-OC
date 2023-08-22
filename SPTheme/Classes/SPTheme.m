//
//  SPTheme.m
//  SPTheme
//
//  Created by GheniAblez on 2023/8/18.
//

#import "SPTheme.h"
#import <CoreText/CoreText.h>

@interface SPTheme ()

//theme dictionary
@property (nonatomic, strong) NSDictionary *themeDictionary;

//theme
@property (nonatomic, strong) NSString *theme;

@end

@implementation SPTheme

+ (instancetype)shareInstance {
    static SPTheme *theme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theme = [[SPTheme alloc] init];
    });
    return theme;
}

+ (NSTextAlignment)getTextAlignment{
    if ([[SPTheme shareInstance] isRTL]) {
        return NSTextAlignmentRight;
    }
    return NSTextAlignmentLeft;
}

+ (NSWritingDirection)getWritingDirection{
    if ([[SPTheme shareInstance] isRTL]) {
        return NSWritingDirectionRightToLeft;
    }
    return NSWritingDirectionLeftToRight;
}

+ (UISemanticContentAttribute)getSemanticContentAttribute{
    if ([[SPTheme shareInstance] isRTL]) {
        return UISemanticContentAttributeForceRightToLeft;
    }
    return UISemanticContentAttributeForceLeftToRight;
}


- (NSBundle *)bundle{
    NSBundle *classBundle = [NSBundle bundleForClass:self.class];
    NSBundle * bundle = [NSBundle bundleWithURL:[classBundle URLForResource:@"SPTheme" withExtension:@"bundle"]];
    return bundle;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _isRTL = [[NSUserDefaults standardUserDefaults] boolForKey:@"SPThemeIsRTL"];
        _theme = [[NSUserDefaults standardUserDefaults] objectForKey:@"SPTheme"];
        if (!_theme) {
            _theme = @"default";
        }
        //load theme dictionary
        NSString *path = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        //if path exit
        if (!path) {
            path = [[self bundle] pathForResource:@"theme" ofType:@"plist"];
        }
        _themeDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return self;
}

- (void)setLightTheme:(NSString *)lightTheme{
    _lightTheme = lightTheme;
    self.theme = lightTheme;
}

- (void)setDarkTheme:(NSString *)darkTheme{
    _darkTheme = darkTheme;
    self.theme = darkTheme;
}

- (void)setIsRTL:(BOOL)isRTL{
    _isRTL = isRTL;
    [[NSUserDefaults standardUserDefaults] setBool:isRTL forKey:@"SPThemeIsRTL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SPRTLChangeNotification" object:nil];
}

- (void)setTheme:(NSString *)theme{
    _theme = theme;
    [[NSUserDefaults standardUserDefaults] setObject:theme forKey:@"SPTheme"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SPThemeChangeNotification" object:nil];
}

- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f) alpha:alpha];
}

- (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

- (UIColor *)adaptColor:(NSString *)key{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            switch (traitCollection.userInterfaceStyle) {
                case UIUserInterfaceStyleDark:
                {
                    self.theme = self.darkTheme?self.darkTheme:@"dark";
                }
                    break;
                default:
                {
                    self.theme = self.lightTheme?self.lightTheme:@"default";
                }
                    break;
            }
            NSString *color;
            @try {
                color = self.themeDictionary[self.theme][@"colors"][key];
            } @catch (NSException *exception) {
                
            } @finally {
                if (!color) {
                    NSString *message = [NSString stringWithFormat:@"color key not found: %@", key];
                    NSError *error = [NSError errorWithDomain:@"SPTheme" code:0 userInfo:@{@"message": message}];
                    NSLog(@"%@", error);
                    color = @"#6B50FF";
                }
            }
            return [self colorWithHexString:color];
        }];
    } else {
        return [self colorWithHexString:self.themeDictionary[self.theme][@"colors"][key]];
    }
}

//adaptSize
- (UIFont *)adaptSize:(NSString *)key{
    CGFloat size = [self.themeDictionary[self.theme][@"sizes"][key] floatValue];
    if(!self.fontFamily){
        NSString *fontPath = [[self bundle] pathForResource:@"ukij_tuz_tom" ofType:@"ttf"];
        NSURL *fontURL = [NSURL fileURLWithPath:fontPath];
        CFErrorRef error;
        if (!CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeProcess, &error)) {
            NSLog(@"Failed to register font: %@", error);
        }
        self.fontFamily = @"UKIJ Tuz Tom";
    }
    return [UIFont fontWithName:self.fontFamily size:size];
}

//adapt String
- (NSString *)adaptString:(NSString *)key{
    return key;
}
@end
