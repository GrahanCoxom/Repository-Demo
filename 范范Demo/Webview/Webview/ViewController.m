//
//  ViewController.m
//  Webview
//
//  Created by Fan on 16/2/29.
//  Copyright © 2016年 Chelwah. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *myWeb;

@property (nonatomic, strong) NSString *currentUrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myWeb = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSString *urlStr = @"http://www.xuelv.cn.com:9696";
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.myWeb.delegate = self;
    self.myWeb.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.myWeb loadRequest:request];
    [self.view addSubview:self.myWeb];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 600, 100, 30);
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    button.layer.backgroundColor = [UIColor redColor].CGColor;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonAction:(UIButton *)sender{

    //要传递的参数一
    NSString *str1 = @"我来自于oc";
    //要传递的参数二
    NSString *str2 = @"我来自于地球";
    NSString *str = [self.myWeb stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"postStr('%@','%@');",str1,str2]];
    NSLog(@"JS返回值：%@",str);


}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    NSLog(@"finish %@",self.currentUrl);
    JSContext *context = [self.myWeb valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    context[@"buttonClick"] = ^(NSString *Str){
    
        //要传递的参数一
        NSString *str1 = @"我来自于oc";
        //要传递的参数二
        NSString *str2 = @"我来自于地球";
        NSString *str = [self.myWeb stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"postStr('%@','%@');",str1,str2]];
        NSLog(@"JS返回值：%@",str);    };

    NSString *jsFunctStr=@"buttonClick";
    [context evaluateScript:jsFunctStr];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    self.currentUrl = [NSString stringWithFormat:@"%@",request.mainDocumentURL];
    
    NSLog(@"%@",self.currentUrl);
    
    [self webViewDidFinishLoad:webView];
    
   return YES;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
