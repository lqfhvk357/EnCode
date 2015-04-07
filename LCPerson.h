//
//  LCPerson.h
//  EnCode
//
//  Created by Mac on 15-3-26.
//  Copyright (c) 2015年 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCPerson : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *sex;

@end