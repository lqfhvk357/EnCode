//
//  LCPerson.m
//  EnCode
//
//  Created by Mac on 15-3-26.
//  Copyright (c) 2015年 chao. All rights reserved.
//

#import "LCPerson.h"
#import <objc/runtime.h>

@implementation LCPerson

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if (self =[super init]) {
        unsigned int outCount;
        Ivar *vars=class_copyIvarList([self class], &outCount);
        for (int i=0; i<outCount; i++) {
            const char *var=ivar_getName(vars[i]);
            NSString *key=[NSString stringWithUTF8String:var];
            [self setValue:[aDecoder decodeObjectForKey:key] forKeyPath:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount;
    Ivar *vars=class_copyIvarList([self class], &outCount);
    for (int i=0; i<outCount; i++) {
        const char *var=ivar_getName(vars[i]);
        NSString *key=[NSString stringWithUTF8String:var];
        [aCoder encodeObject:[self valueForKeyPath:key] forKey:key];
    }
}


@end
