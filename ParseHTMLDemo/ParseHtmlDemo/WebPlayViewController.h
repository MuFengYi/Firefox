//
//  WebPlayViewController.h
//  JII
//
//  Created by macro macro on 2017/5/27.
//  Copyright © 2017年 macro macro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPlayViewController : UIViewController
@property   (nonatomic,strong)NSString  *videoUrl;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
