//
//  WkPlayViewController.m
//  ParseHtmlDemo
//
//  Created by macro macro on 2018/4/26.
//  Copyright © 2018年 pi. All rights reserved.
//

#import "WkPlayViewController.h"
#import <WebKit/WebKit.h>
#import "Post.h"
@interface WkPlayViewController ()
@property   (nonatomic,strong)NSArray *urlArray;
@property   (nonatomic,strong)   WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *buttonVIew;
@end

@implementation WkPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view insertSubview:self.webView atIndex:0];
    self.urlArray   =   [NSArray arrayWithObjects:@"https://test.xlcwnet.com/", @"https://www.bilibili.com/",@"http://www.youku.com/",@"http://www.iqiyi.com/",@"http://sports.pptv.com/",@"http://tv.cctv.com/live/cctv5/",nil];
}
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    NSLog(@"webViewWebContentProcessDidTerminate:  当Web视图的网页内容被终止时调用。");
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"webView:didFinishNavigation:  响应渲染完成后调用该方法   webView : %@  -- navigation : %@  \n\n",webView,navigation);
}


- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"webView:didStartProvisionalNavigation:  开始请求  \n\n");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"webView:didCommitNavigation:   响应的内容到达主页面的时候响应,刚准备开始渲染页面应用 \n\n");
}


// error
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    // 类似 UIWebView 的- webView:didFailLoadWithError:

    NSLog(@"webView:didFailProvisionalNavigation:withError: 启动时加载数据发生错误就会调用这个方法。  \n\n");
}



- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"webView:didFailNavigation: 当一个正在提交的页面在跳转过程中出现错误时调用这个方法。  \n\n");
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

    NSLog(@"请求前会先进入这个方法  webView:decidePolicyForNavigationActiondecisionHandler: %@   \n\n  ",navigationAction.request);

    decisionHandler(WKNavigationActionPolicyAllow);

}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    NSLog(@"返回响应前先会调用这个方法  并且已经能接收到响应webView:decidePolicyForNavigationResponse:decisionHandler: Response?%@  \n\n",navigationResponse.response);

    decisionHandler(WKNavigationResponsePolicyAllow);
}



- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{

    NSLog(@"webView:didReceiveServerRedirectForProvisionalNavigation: 重定向的时候就会调用  \n\n");
}

- (IBAction)clickButton:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[self.urlArray objectAtIndex:sender.tag-1]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
     [self.webView setHidden:NO];
    [self.buttonVIew setHidden:YES];
}
- (IBAction)backLastView:(UIButton *)sender {
    if (  [self.webView canGoBack]) {
        [self.webView goBack];
    }else
    {
        if (self.buttonVIew.hidden==YES) {
            [self.buttonVIew setHidden:NO];
            [self.webView setHidden:YES];
        }else
        {

        }
    }
}
#pragma mark 解析视频url中的mp4地址
- (IBAction)parseVideo:(UIButton*)sender
{
    WebParseObject  *webParseObject =   [[WebParseObject alloc] init];
    webParseObject.kUrlStr  =   [NSString stringWithFormat:@"%@",self.webView.URL];
    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://test.xlcwnet.com"] encoding:NSUTF8StringEncoding error:nil];
//    webParseObject.firstXPath   =   @"//*[@class='mw-videos-box']";
//    webParseObject.secondXPath  = @"//*[@id='video']";
//    [Post getVideourl:webParseObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
