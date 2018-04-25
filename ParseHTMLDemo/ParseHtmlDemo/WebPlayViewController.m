//
//  WebPlayViewController.m
//  JII
//
//  Created by macro macro on 2017/5/27.
//  Copyright © 2017年 macro macro. All rights reserved.
//

#import "WebPlayViewController.h"
//#import "BigClickButton.h"
@interface WebPlayViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayout;
//@property   (nonatomic,strong)     BigClickButton   *bigClickButton;
@end

@implementation WebPlayViewController
#pragma mark 强制横屏的方法
//- (BOOL)shouldAutorotate {
//    return NO;
//}
//
//- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscapeRight;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationLandscapeRight;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([UIScreen mainScreen].bounds.size.width>=320) {
        _toplayout.constant =   -64;
        [self.view updateConstraints];
    }
    // Do any additional setup after loading the view.
//    UIButton    *button =   [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"icon--返回白"] forState:UIControlStateNormal];
//    button.userInteractionEnabled   =   NO;
//    _bigClickButton     =   [[BigClickButton alloc]init];
//    _bigClickButton.frame   =   CGRectMake(0, 20, 50, 50);
//    [_bigClickButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_bigClickButton insertButton:button withCGSize:CGSizeMake(36, 36)];
//    [_webView addSubview:_bigClickButton];
//    _webView.scrollView.scrollEnabled = NO;

//    NSString    *jsxs =   @"<div class=\"webui\" style=\"width:100%;height:100%\">\n""<p style=\"text-align: center;\">  \n" "%@""align=\"\" src=\"http://player.youku.com/embed/""%@" "\" frameborder=\"0\" scrolling=\"no\"></iframe>  \n" "</p>\n" "</div>";
//    NSString    *middleString   =   [NSString stringWithFormat:@"<iframe height=%f width=%f",SCREENWIDTH,SCREENHEIGHT];
//    NSString    *html= [NSString stringWithFormat:jsxs,middleString,[self getYoukuVideoIdByUrl:self.videoUrl]];
//    NSLog(@"_videoString======%@",self.videoUrl);

    // 2.创建URL
    NSURL *url = [NSURL URLWithString:self.videoUrl];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [_webView loadRequest:request];
    NSLog(@"_webView.frame=====%@",_webView);
//    [_webView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(-8);
//        make.top.mas_equalTo(-8);
//        make.width.mas_equalTo(SCREENWIDTH+8);
//        make.height.mas_equalTo(SCREENHEIGHT);
//    }];


//    if ([GlobalObject showNoNetWork])
//    {
        //        return;
//    }
}
/** 截取出优酷视频的id*/
-(NSString *)getYoukuVideoIdByUrl:(NSString *)videourl
{
    if (videourl != nil && ![videourl isEqualToString:@""])
    {
        NSString *youkuId;
        NSArray *firSep = [videourl componentsSeparatedByString:@"="];
        if ([firSep count] > 0 && firSep != nil)
        {
            youkuId =   [firSep objectAtIndex:1];
            
        }
        return youkuId;
    } else {
        return @"";
    }
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
