//
//  LCViewController.m
//  EnCode
//
//  Created by Mac on 15-3-26.
//  Copyright (c) 2015年 chao. All rights reserved.
//

#import "LCViewController.h"
#import "LCPerson.h"
//#import <objc/runtime.h>

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LCPerson *p1=[[LCPerson alloc] init];
    p1.age=100;
    p1.sex=@"man";
    p1.name=@"luo";
    
    NSString *path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"mydatss"];
    NSMutableData *myData=[NSMutableData data];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:myData];
    [archiver encodeObject:p1 forKey:@"p1"];
    [archiver finishEncoding];
    [myData writeToFile:path atomically:YES];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    LCPerson *p2=[[LCPerson alloc] init];
    NSString *path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"mydatss"];
    NSMutableData *myData=[NSMutableData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    p2=[unarchiver decodeObjectForKey:@"p1"];
    [unarchiver finishDecoding];
    NSLog(@"%@ %d %@", p2.name, p2.age, p2.sex);
}

@end
