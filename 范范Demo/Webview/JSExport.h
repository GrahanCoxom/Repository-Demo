//
//  JSExport.h
//  TestJSOC
//
//  Created by dashu on 16/3/2.
//  Copyright © 2016年 dashu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TextJSObjectProtocol <JSExport>

-(void)TextNoParameter;

-(void)TextOneParameter:(NSString *)message;

-(void)TextTwoParameter:(NSString *)message1 SecondParameter:(NSString *)message2;

@end

@interface JSExport : NSObject<TextJSObjectProtocol>

@end
