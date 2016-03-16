//
//  JSExport.m
//  TestJSOC
//
//  Created by dashu on 16/3/2.
//  Copyright © 2016年 dashu. All rights reserved.
//

#import "JSExport.h"

@implementation JSExport

-(void)TextNoParameter{
    NSLog(@"没有参数");
}

-(void)TextOneParameter:(NSString *)message{
    NSLog(@"一个参数=%@",message);
}

-(void)TextTwoParameter:(NSString *)message1 SecondParameter:(NSString *)message2{
    NSLog(@"第一个参数=%@,第二个参数=%@",message1,message2);
}

@end
