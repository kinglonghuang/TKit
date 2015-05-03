//
//  NSMutableDictionary+BasicTools.m
//  TKit
//
//  Created by TangJR on 15/5/3.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "NSMutableDictionary+BasicTools.h"

@implementation NSMutableDictionary (BasicTools)

- (void)setSafeObject:(id)object forKey:(id)key {
    
    if (object != nil && ![object isEqual:[NSNull null]] && key != nil && ![key isEqual:[NSNull null]]) {
        
        [self setObject:object forKey:key];
    }
}

@end