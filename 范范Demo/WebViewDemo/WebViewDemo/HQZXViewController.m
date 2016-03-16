//
//  HQZXViewController.m
//  WebViewDemo
//
//  Created by AndrewTzx on 14-2-17.
//  Copyright (c) 2014年 YLink. All rights reserved.
//

#import "HQZXViewController.h"

@interface HQZXViewController ()

@end

@implementation HQZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *strURL = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *requestString = [[request URL] absoluteString];//获取请求的绝对路径.
	NSArray *components = [requestString componentsSeparatedByString:@":"];//提交请求时候分割参数的分隔符
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
        
        //过滤请求是否是我们需要的.不需要的请求不进入条件
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            
            NSString *message = (NSString *)[components objectAtIndex:2];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JS向APP提交数据" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
            
        }
        return NO;
    }
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getMessageFromApp('%@')", @"加载结束调用方法"]];
}

- (IBAction)messageToHtml:(id)sender {
    NSString *message = self.jsText.text;
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getMessageFromApp('%@')", message]];
}
@end
