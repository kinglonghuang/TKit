//
//  TJRKit.m
//  TJRKit
//
//  Created by TangJR on 15/1/27.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "TTools.h"
#import <CommonCrypto/CommonDigest.h>

UIImage * TImageWithName(NSString *imageName) {
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:imageName]];
    
    return image;
}

UIColor * TColorWithRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
    
    return color;
}

UIView * TLeftViewWithWidthHeight(CGFloat width, CGFloat height) {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    return view;
}

CGFloat TProportion(void) {
    
    return T_SCREEN_WIDTH / 320;
}

CGRect TRectWithProportant(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    
    return CGRectMake(x * TProportion(), y * TProportion(), width * TProportion(), height * TProportion());
}

UIFont * TFontWithSize(CGFloat size) {
    
    return [UIFont systemFontOfSize:size];
}

UIFont * TFontBoldWithSize(CGFloat size) {
    
    return [UIFont boldSystemFontOfSize:size];
}

UIFont * TFontProportantWithSize(CGFloat size) {
    
    return [UIFont systemFontOfSize:size * TProportion()];
}

UIFont * TFontBoldProportantWithSize(CGFloat size) {
    
    return [UIFont boldSystemFontOfSize:size * TProportion()];
}

UIViewController * TRootViewController(void) {
    
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

UIWindow *TWindow(void) {
    
    return [[[UIApplication sharedApplication] delegate] window];
}

NSString * TCurrentDateStringWithSeparatorType(enum TDateFormatterSeparatorType type) {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM/dd"];
    return [dateFormat stringFromDate:[NSDate date]];
}

NSString * TCurrentTimeString(void) {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    return [dateFormat stringFromDate:[NSDate date]];
}

NSDate * TDateWithDateString(NSString *string, enum TDateFormatterSeparatorType type) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSString *formatter = @"yyyy/MM/dd";
    
    switch (type) {
        case kTDateFormatterSeparatorDot:
            
            formatter = @"yyyy.MM.dd";
            break;
        case kTDateFormatterSeparatorSlash:
            
            formatter = @"yyyy/MM/dd";
            break;
        case kTDateFormatterSeparatorSpace:
            
            formatter = @"yyyy MM dd";
            break;
        case kTDateFormatterSeparatorHyphen:
            
            formatter = @"yyyy-MM-dd";
            break;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatter];
    return [dateFormat dateFromString:string];
}

NSDate * TTimeWithTimeString(NSString *string) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    return [dateFormat dateFromString:string];
}

NSDate *TDateTimeWithDateTimeString(NSString *string, enum TDateFormatterSeparatorType type) {
    
    if (TIsStringNil(string)) {
        
        return nil;
    }
    NSString *formatter = @"yyyy/MM/dd";
    
    switch (type) {
        case kTDateFormatterSeparatorDot:
            
            formatter = @"yyyy.MM.dd";
            break;
        case kTDateFormatterSeparatorSlash:
            
            formatter = @"yyyy/MM/dd";
            break;
        case kTDateFormatterSeparatorSpace:
            
            formatter = @"yyyy MM dd";
            break;
        case kTDateFormatterSeparatorHyphen:
            
            formatter = @"yyyy-MM-dd";
            break;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:[NSString stringWithFormat:@"%@ HH:mm", formatter]];
    return [dateFormat dateFromString:string];
}

NSURL *TImageFullPath(NSString *imageName) {
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", TBaseIamgeURL, imageName]];
}

NSURL * TNetworkFullURL(NSString *suffix) {
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", TBaseURL, suffix]];
}

NSString * TNetworkFullString(NSString *suffix) {
    
    return [NSString stringWithFormat:@"%@/%@", TBaseURL, suffix];
}

NSString * TImageFullString(NSString *suffix) {
    
    return [NSString stringWithFormat:@"%@%@", TBaseIamgeURL, suffix];
}

NSString * TSandBoxPathWithFinderType(enum TSandBoxFinderType type) {
    
    if (type == kTSandBoxFinderDocument) {
        
        return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    }
    if (type == kTSandBoxFinderLibrary) {
        
        return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    }
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}

CGFloat TMaxHeightWithView(UIView *view) {
    
    return view.bounds.size.height + view.frame.origin.y;
}

CGFloat TMaxWidthWithView(UIView *view) {
    
    return view.bounds.size.width + view.frame.origin.x;
}

enum TDeviceScreenType TCurrentDeviceScreenType(void) {
    
    if (T_SCREEN_HEIGHT == 480) {
        
        return kTDeviceScreenIPhone4;
    }
    if (T_SCREEN_HEIGHT == 568) {
        
        return kTDeviceScreenIPhone5;
    }
    if (T_SCREEN_HEIGHT == 1134) {
        
        return kTDeviceScreenIPhone6;
    }
    if (T_SCREEN_HEIGHT == 2208) {
        
        return kTDeviceScreenIPhone6P;
    }
    
    return kTDeviceScreenUnknown;
}

enum TSystemVersion TCurrentSystemVersion(void) {
    
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (systemVersion >= 6) {
        
        return kTSystemVersion6;
    }
    if (systemVersion >= 7) {
        
        return kTSystemVersion7;
    }
    if (systemVersion >= 8) {
        
        return kTSystemVersion8;
    }
    if (systemVersion >= 8.1) {
        
        return kTSystemVersion81;
    }
    return kTSystemVersionUnknown;
}

enum TNetworkType TCurrentNetworkType(void) {
    
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    switch ([reachability currentReachabilityStatus]) {
            
        case NotReachable:
            return kTNetworkNone;
            
        case ReachableViaWWAN:
            return kTNetworkWWAN;
            
        case ReachableViaWiFi:
            return kTNetworkWifi;
            
        default:
            return kTNetworkNone;
    }
}

id TFileWithPathAndName(NSString *path, NSString *fileName, enum TFileType type) {
    
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, fileName];
    
    if (TIsStringNil(path)) {
        
        fullPath = fileName;
    }
    
    if (TIsStringNil(fileName)) {
        
        fullPath = path;
    }
    
    if (!TIsFileExistWithPath(path)) {
        
        return nil;
    }
    
    switch (type) {
        case kTFileTxt:
            return [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:NULL];
            
        case kTFileImage:
            return [UIImage imageWithContentsOfFile:fullPath];
            
        case kTFilePListDic:
            return [[NSDictionary alloc] initWithContentsOfFile:fullPath];
            
        case kTFilePListArray:
            return [[NSArray alloc] initWithContentsOfFile:fullPath];
            
        default:
            return nil;
    }
}

enum TSaveFileResultType TSaveFileWithPathAndName(NSString *path, NSString *fileName, NSData *fileData, enum TFileType type, BOOL shouldReplace) {
    
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, fileName];
    
    // 如果不需要替换，则检查文件是否存在
    if (shouldReplace == NO && TIsFileExistWithPath(fullPath)) {
        
        return kTSaveFileResultExist;
    }
    
    // 如果路径不存在，则创建路径
    if (TIsFileExistWithPath(fullPath) == NO) {
        
        NSError *error = nil;
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        
        if (error != NULL) {
            
            return kTSaveFileResultNotFound;
        }
    }
    
    return [fileData writeToFile:fullPath atomically:YES];
}

NSString * TMD5(NSString *string) {
    
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

void TScheduleLocalNotification(NSDate *fireDate, NSString *alertBody, NSCalendarUnit repeatInterval, NSInteger badgeNumber, NSString *notificationId) {
    
    if (TIsObjectNil(fireDate) || TIsStringNil(alertBody) || TIsStringNil(notificationId)) {
        
        return;
    }
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = fireDate;
    localNotification.alertBody = alertBody;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.repeatInterval = repeatInterval;
    localNotification.applicationIconBadgeNumber = badgeNumber;
    localNotification.userInfo = @{@"id" : notificationId};
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

void TCancelLocalNotificationWithNotificationId(NSString *notificationId) {
    
    if (TIsStringNil(notificationId)) {
        
        return;
    }
    NSArray *notifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *localNotification in notifications) {
        
        if ([[localNotification.userInfo objectForKey:@"id"] isEqualToString:notificationId]) {
            
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
        }
    }
}

#pragma mark - 获取工程信息

NSString * TBundleId(void) {
    
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *identifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return identifier;
}

NSString * TBundleVersion(void) {
    
    return [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

NSString * TUUID(void) {
    
    CFUUIDRef uuid_ref = CFUUIDCreate(nil);
    CFStringRef uuid_string_ref= CFUUIDCreateString(nil, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge_transfer NSString*)uuid_string_ref];
    return uuid;
}

#pragma mark - 常用判断

BOOL TIsStringNil(NSString *string) {
    
    if ([string respondsToSelector:@selector(length)] && string.length > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsArrayNil(NSArray *array) {
    
    if ([array respondsToSelector:@selector(count)] && array.count > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsDictionaryNil(NSDictionary *dictionay) {
    
    if ([dictionay respondsToSelector:@selector(allKeys)] && [dictionay allKeys].count > 0) {
        
        return NO;
    }
    return YES;
}

BOOL TIsObjectNil(id object) {
    
    if (object == nil || [object isEqual:[NSNull null]]) {
        
        return YES;
    }
    return NO;
}

BOOL TIsFileExistWithPath(NSString *path) {
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

BOOL TIsDeleteFileWithPath(NSString *path) {
    
    if (TIsFileExistWithPath(path)) {
        
        return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    return NO;
}

BOOL TIsRegexCorrectWithRegexType(NSString *string, enum TRegexType type) {
    
    if (TIsStringNil(string)) {
        
        return NO;
    }
    
    switch (type) {
        case kTRegexEmail:
            return TIsRegexEmail(string);
            
        case kTRegexCharacter:
            return TIsRegexEnglishCharacter(string);
            
        case kTRegexNumber:
            return TIsRegexNumber(string);
            
        case kTRegexPhone:
            return TIsRegexPhone(string);
            
        case kTRegexSpecialCharacter:
            return TIsRegexSpecialCharacter(string);
            
        case kTRegexMobilePhone:
            return TIsRegexMobilePhone(string);
            
        case kTRegexIdCard:
            return TIsRegexIdCard(string);
            
        case kTRegexChinieseAmount:
            return TIsRegexChinieseAmount(string);
            
        default:
            return NO;
    }
}

BOOL TIsRegexEmail(NSString *email) {
    
    if (TIsStringNil(email)) {
        
        return NO;
    }
    
    NSString *regexString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    
    return [predicate evaluateWithObject:email];
}

BOOL TIsRegexEnglishCharacter(NSString *character) {
    
    if (TIsStringNil(character)) {
        
        return NO;
    }
    
    NSString *regexString = @"^[A-Za-z]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    
    return [predicate evaluateWithObject:character];
}

BOOL TIsRegexNumber(NSString *number) {
    
    if (TIsStringNil(number)) {
        
        return NO;
    }
    
    NSString *regexString = @"^-?\\d+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:number];
}

BOOL TIsRegexPhone(NSString *phone) {
    
    if (TIsStringNil(phone)) {
        
        return NO;
    }
    
    NSString * MOBILE = @"^[1][34578]\\d{9}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSString * PHS=@"^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];//China Mobile
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];//China Unicom
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];//China Telecom
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];//PHS
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES)
        || ([regextestphs evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    return NO;
}

BOOL TIsRegexSpecialCharacter(NSString *specialCharacter) {
    
    if (TIsStringNil(specialCharacter)) {
        
        return NO;
    }
    
    NSString *regexString = @"^[A-Za-z0-9\u4E00-\u9FA5_-]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regexString];
    
    return ![predicate evaluateWithObject:specialCharacter];
}

BOOL TIsRegexMobilePhone(NSString *mobilePhone) {
    
    if (TIsStringNil(mobilePhone)) {
        
        return NO;
    }
    
    NSString * regexString = @"^[1][34578]\\d{9}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:mobilePhone];
}

BOOL TIsRegexIdCard(NSString *idCard) {
    
    if (TIsStringNil(idCard)) {
        
        return NO;
    }
    
    NSString * regexString = @"(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regexString];
    
    return [predicate evaluateWithObject:idCard];
}

BOOL TIsRegexChinieseAmount(NSString *chinieseString) {
    
    if (TIsStringNil(chinieseString)) {
        
        return NO;
    }
    
    NSInteger count = 0;
    for (int i = 0; i < chinieseString.length; i++) {
        unichar ch = [chinieseString characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff)
        {
            count++;
        }
    }
    return count;
}

#pragma mark - 基础控件

void TAlertViewShow(NSString *message) {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
    [alert show];
}

CGSize TAutoLabelSize(NSString *string, CGSize maxSize, UIFont *font) {
    
    // 根据文字内容，自适应label大小
    UILabel *labelRight = [[UILabel alloc] init];
    labelRight.text = string;
    labelRight.font = font;
    // 计算文本占用大小（设置最大宽为150：即150就换行，最大高为300：即300就开始用...代替）
    CGSize constraintSize = maxSize;
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    // 文本属性（根据字号计算需要的空间大小）
    NSDictionary *attributes = @{NSFontAttributeName: font};
    // IOS7的方法  是NSString的方法
    CGRect rect = [labelRight.text boundingRectWithSize:constraintSize options:options attributes:attributes context:nil];
    // 配置最大显示行数 0为不限制行数
    labelRight.numberOfLines = 0;
    // 配置换行
    labelRight.lineBreakMode = NSLineBreakByWordWrapping;
    
    return rect.size;
}

UIImage * TScreenShotInWindow(void) {
    
    return TScreenShotWithView(TWindow());
}

UIImage * TScreenShotWithView(UIView *view) {
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

UIImage * TCaptureImageWithImageAndRect(UIImage *image, CGRect rect) {
    
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

UIImage * TScaleImageWithMaxSize(UIImage *image, CGSize maxSize) {
    
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    
    if (width < maxSize.width && height < maxSize.height) {
        
        return image;
    }
    
    CGFloat scale = width / maxSize.width > height / maxSize.height ? width / maxSize.width : height / maxSize.height;
    
    return TScaleImageWithScale(image, scale);
}

UIImage * TScaleImageWithScale(UIImage *image, CGFloat scale) {
    
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    
    CGSize newSize = CGSizeMake(width * scale, height * scale);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - 断言