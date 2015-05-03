//
//  TJRKit.h
//  TJRKit
//
//  Created by TangJR on 15/1/27.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "GTMBase64.h"
#import "TDefine.h"
#import "NSMutableDictionary+BasicTools.h"

#pragma mark - 枚举

// 日期字符串分隔符
NS_ENUM(NSInteger, TDateFormatterSeparatorType) {
    
    kTDateFormatterSeparatorHyphen = 0,  // 分隔符为 '-'
    kTDateFormatterSeparatorSlash,       // 分隔符为 '/'
    kTDateFormatterSeparatorSpace,       // 分隔符为 ' '
    kTDateFormatterSeparatorDot          // 分隔符为 '.'
};

// 网络类型
NS_ENUM(NSInteger, TNetworkType) {
    
    kTNetworkNone = 0,   // 没有网络
    kTNetworkWWAN,       // 3G网络
    kTNetworkWifi        // Wifi网络
};

// 设备型号
NS_ENUM(NSInteger, TDeviceScreenType) {
    
    kTDeviceScreenUnknown = 0, // 未知设备
    kTDeviceScreenIPhone4,     // iPhone4
    kTDeviceScreenIPhone5,     // iPhone5
    kTDeviceScreenIPhone6,     // iPhone6
    kTDeviceScreenIPhone6P     // iPhone6 plus
};

// 沙盒文件夹类型
NS_ENUM(NSInteger, TSandBoxFinderType) {
    
    kTSandBoxFinderDocument = 0,    // Document路径
    kTSandBoxFinderLibrary,         // Library路径
    kTSandBoxFinderTemp             // temp路径
};

// 数据格式验证类型
NS_ENUM(NSInteger, TRegexType) {
    
    kTRegexEmail = 0,           // 邮箱格式是否正确
    kTRegexCharacter,           // 全都为英文字符
    kTRegexSpecialCharacter,    // 是否包含特殊字符
    kTRegexNumber,              // 全部为数字
    kTRegexPhone,               // 电话格式
    kTRegexMobilePhone,         // 手机号码格式
    kTRegexIdCard,              // 身份证格式
    kTRegexChinieseAmount       // 包含中文
};

// 文件格式类型
NS_ENUM(NSInteger, TFileType) {
    
    kTFileImage = 0,       // image格式
    kTFileTxt,             // txt格式
    kTFilePListDic,        // plist dic格式
    kTFilePListArray       // plist array格式
};

// 保存文件结果类型
NS_ENUM(NSInteger, TSaveFileResultType) {
    
    kTSaveFileResultFail = 0,   // 保存失败
    kTSaveFileResultSuccess,    // 保存成功
    kTSaveFileResultExist,      // 文件已存在
    kTSaveFileResultNotFound    // 路径创建失败
};

// 系统版本
NS_ENUM(NSInteger, TSystemVersion) {
    
    kTSystemVersionUnknown = 0, // 其他版本
    kTSystemVersion6,           // iOS6以上
    kTSystemVersion7,           // iOS7以上
    kTSystemVersion8,           // iOS8以上
    kTSystemVersion81           // iOS8.1以上
};

#pragma mark - C函数

/**
 *  通过图片名称获取图片
 *
 *  @param imageName 图片名称
 *
 *  @return 返回的图片
 */
UIImage * TImageWithName(NSString *imageName);

/**
 *  通过RGB与透明度获取颜色
 *
 *  @param red   红色
 *  @param green 绿色
 *  @param blue  蓝色
 *  @param alpha 透明度
 *
 *  @return 颜色
 */
UIColor * TColorWithRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
 *  获得一个透明的leftview
 *
 *  @param width  宽度
 *  @param height 高度
 *
 *  @return 左视图
 */
UIView * TLeftViewClear(CGFloat width, CGFloat height);

/**
 *  获得屏幕缩放大小
 *
 *  @return 缩放大小
 */
CGFloat TProportion(void);

/**
 *  按比例缩放坐标与大小
 *
 *  @param x      x坐标
 *  @param y      y坐标
 *  @param width  宽
 *  @param height 高
 *
 *  @return 缩放过后的坐标与大小
 */
CGRect TRectWithProportant(CGFloat x, CGFloat y, CGFloat width, CGFloat height);

/**
 *  按大小获取字体
 *
 *  @param size 大小
 *
 *  @return 字体
 */
UIFont * TFontWithSize(CGFloat size);

/**
 *  按大小获取加粗字体
 *
 *  @param size 大小
 *
 *  @return 字体
 */
UIFont * TFontBoldWithSize(CGFloat size);

/**
 *  获取缩放比例的字体
 *
 *  @param size 大小
 *
 *  @return 字体
 */
UIFont * TFontProportantWithSize(CGFloat size);

/**
 *  获取缩放比例的加粗字体
 *
 *  @param size 大小
 *
 *  @return 字体
 */
UIFont * TFontBoldProportantWithSize(CGFloat size);

/**
 *  获取当前日期字符串
 *
 *  @param type 分隔符类型
 *
 *  @return 日期字符串
 */
NSString * TCurrentDateStringWithSeparatorType(enum TDateFormatterSeparatorType type);

/**
 *  获取当前时间字符串
 *
 *  @return 时间字符串
 */
NSString * TCurrentTimeString(void);

/**
 *  根据日期字符串与分隔符格式获得日期
 *
 *  @param string   日期字符串
 *  @param type     字符串的分隔符类型
 *
 *  @return NSDate格式的日期
 */
NSDate * TDateWithDateString(NSString *string, enum TDateFormatterSeparatorType type);

/**
 *  根据时间字符串获得时间(HH:mm)
 *
 *  @param string 时间字符串
 *
 *  @return NSDate格式的时间
 */
NSDate * TTimeWithTimeString(NSString *string);

/**
 *  根据日期与时间字符串与分隔符格式获得完整日期时间(yyyy-MM-dd HH:mm)
 *
 *  @param string   日期时间字符串
 *  @param type     字符串的分隔符类型
 *
 *  @return NSDate格式的日期时间
 */
NSDate * TDateTimeWithDateTimeString(NSString *string, enum TDateFormatterSeparatorType type);

/**
 *  获取网络图片完成URL路径（路径前缀在T_IMAGE_PATH中配置）
 *
 *  @param imageName 图片名称
 *
 *  @return 图片完整URL路径
 */
NSURL * TImageFullPath(NSString *imageName);

/**
 *  获取网络请求完整地址(路径前缀在T_BASE_URL中配置)
 *
 *  @param suffix 后缀
 *
 *  @return 完整地址
 */
NSURL * TNetworkFullURL(NSString *suffix);

/**
 *  获取网络图片完成NSString路径（路径前缀在T_IMAGE_PATH中配置）
 *
 *  @param suffix 后缀
 *
 *  @return 完整地址
 */
NSString * TImageFullString(NSString *suffix);

/**
 *  获取网络请求完成路径
 *
 *  @param suffix 后缀
 *
 *  @return 完成路径
 */
NSString * TNetworkFullString(NSString *suffix);

/**
 *  根据所需文件夹类型，获取对应的路径
 *
 *  @param type 文件夹类型
 *
 *  @return 路径
 */
NSString * TSandBoxPathWithFinderType(enum TSandBoxFinderType type);

/**
 *  获得view的height + y
 *
 *  @param view 视图
 *
 *  @return height + y
 */
CGFloat TMaxHeightWithView(UIView *view);

/**
 *  获得view的width + x
 *
 *  @param view 视图
 *
 *  @return width + x
 */
CGFloat TMaxWidthWithView(UIView *view);

/**
 *  根据屏幕尺寸，获取设备类型
 */
enum TDeviceScreenType TCurrentDeviceScreenType(void);

/**
 *  获取当前编译器版本
 */
enum TSystemVersion TCurrentSystemVersion(void);

/**
 *  获取当前网络状况
 */
enum TNetworkType TCurrentNetworkType(void);

/**
 *  通过文件路径获取文件
 *
 *  @param path     路径
 *  @param fileName 文件名
 *  @param type     文件类型
 *
 *  @return 文件
 */
id TFileWithPathAndName(NSString *path, NSString *fileName, enum TFileType type);

/**
 *  通过文件路径获取文件
 *
 *  @param path          路径
 *  @param fileName      文件名
 *  @param fileData      文件数据
 *  @param type          文件类型
 *  @param shouldReplace 是否替换
 *
 *  @return 保存状态
 */
enum TSaveFileResultType TSaveFileWithPathAndName(NSString *path, NSString *fileName, NSData *fileData, enum TFileType type, BOOL shouldReplace);

/**
 *  16位MD5加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return 加密过后的字符串
 */
NSString * TMD5(NSString *string);

/**
 *  注册一个本地通知
 *
 *  @param fireDate       触发时间
 *  @param alertBody      触发时显示的内容
 *  @param repeatInterval 循环间隙
 *  @param badgeNumber    应用icon上显示的badge数量
 *  @param notificationId 通知的id，用于移除本地通知
 */
void TScheduleLocalNotification(NSDate *fireDate, NSString *alertBody, NSCalendarUnit repeatInterval, NSInteger badgeNumber, NSString *notificationId);

/**
 *  根据通知id移除本地通知
 *
 *  @param notificationId 通知的id
 */
void TCancelLocalNotificationWithNotificationId(NSString *notificationId);

#pragma mark - 获取工程信息

/**
 *  获取工程BundleId
 *
 *  @return 工程BundleId
 */
NSString * TBundleId(void);

/**
 *  获取工程版本号
 *
 *  @return 工程版本号
 */
NSString * TVersion(void);

/**
 *  获取uuid
 *
 *  @return uuid
 */
NSString * TUUID(void);

#pragma mark - 常见判断

/**
 *  判断字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return 空YES；非空NO
 */
BOOL TIsStringNil(NSString *string);

/**
 *  判断数组是否为空
 *
 *  @param array 数组
 *
 *  @return 空YES；非空NO
 */
BOOL TIsArrayNil(NSArray *array);

/**
 *  判断字典是否为空
 *
 *  @param dictionay 字典
 *
 *  @return 空YES；非空NO
 */
BOOL TIsDictionaryNil(NSDictionary *dictionay);

/**
 *  判断对象是否为空
 *
 *  @param object 对象
 *
 *  @return 空YES；非空NO
 */
BOOL TIsObjectNil(id object);

/**
 *  判断文件是否存在
 *
 *  @param path 文件路径(包含文件名)
 *
 *  @return 存在YES；不存在NO
 */
BOOL TIsFileExistWithPath(NSString *path);

/**
 *  删除文件，并返回是否删除成功
 *
 *  @param path 文件路径(包含文件名)
 *
 *  @return 删除成功YES；失败NO
 */
BOOL TIsDeleteFileWithPath(NSString *path);

/**
 *  根据需要判断的类型，判断数据合法性
 *
 *  @param string 需要判断的数据
 *  @param type   判断类型
 *
 *  @return 是否合法
 */
BOOL TIsRegexCorrectWithRegexType(NSString *string, enum TRegexType type);

/**
 *  判断是否是邮箱格式
 *
 *  @param email 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexEmail(NSString *email);

/**
 *  判断是否全部为英文字符
 *
 *  @param character 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexEnglishCharacter(NSString *character);

/**
 *  判断是否全部为数字
 *
 *  @param number 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexNumber(NSString *number);

/**
 *  判断是否为电话格式
 *
 *  @param phone 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexPhone(NSString *phone);

/**
 *  判断是否包含特殊字符
 *
 *  @param specialCharacter 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexSpecialCharacter(NSString *specialCharacter);

/**
 *  判断是否为手机号码
 *
 *  @param mobilePhone 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexMobilePhone(NSString *mobilePhone);

/**
 *  判断是否为身份证号码
 *
 *  @param idCard 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexIdCard(NSString *idCard);

/**
 *  判断是否有中文
 *
 *  @param chinieseString 字符串
 *
 *  @return 是YES；不是NO
 */
BOOL TIsRegexChinieseAmount(NSString *chinieseString);

#pragma mark - 基础控件

/**
 *  弹出title为“温馨提示”，只有“确认”按钮的警告框
 *
 *  @param message 警告框内容
 */
void TAlertViewShow(NSString *message);

/**
 *  获取根控制器
 *
 *  @return 根控制器
 */
UIViewController * TRootViewController(void);

/**
 *  获取window
 *
 *  @return window
 */
UIWindow *TWindow(void);

/**
 *  UILabel自适应大小
 *
 *  @param string  label上的文本
 *  @param maxSize 最大大小
 *  @param font    label的字体
 *
 *  @return 自适应的大小
 */
CGSize TAutoLabelSize(NSString *string, CGSize maxSize, UIFont *font);

/**
 *  截图window图
 *
 *  @return window截图
 */
UIImage * TScreenShotInWindow(void);

/**
 *  给view截图
 *
 *  @param view view
 *
 *  @return 截图
 */
UIImage * TScreenShotWithView(UIView *view);

/**
 *  根据大小，在图片中截取图片
 *
 *  @param image 原始图片
 *  @param rect  范围与坐标
 *
 *  @return 截取之后的图片
 */
UIImage * TCaptureImageWithImageAndRect(UIImage *image, CGRect rect);

/**
 *  根据二维码包含的字符串与图片大小（正方形）生成二维码图片
 *
 *  @param string     二维码包含的字符串信息
 *  @param imageWidth 图片的宽
 *
 *  @return 生成的二维码图
 */
UIImage * TGenerateQRCodeWithString(NSString *string, CGFloat imageWidth);

/**
 *  根据设置的最大尺寸，缩放图片
 *
 *  @param image   待缩放的图片
 *  @param maxSize 最大尺寸
 *
 *  @return 缩放过后的图片
 */
UIImage * TScaleImageWithMaxSize(UIImage *image, CGSize maxSize);

UIImage * TScaleImageWithScale(UIImage *image, CGFloat scale);