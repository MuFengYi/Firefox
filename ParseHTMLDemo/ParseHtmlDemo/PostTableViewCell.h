//
//  PostTableViewCell.h
//  ParseHtmlDemo
//
//  Created by macro macro on 2018/4/24.
//  Copyright © 2018年 pi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@interface PostTableViewCell : UITableViewCell
@property   (nonatomic,strong)Post  *post;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *posttitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end
