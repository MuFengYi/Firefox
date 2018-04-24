//
//  PostTableViewCell.m
//  ParseHtmlDemo
//
//  Created by macro macro on 2018/4/24.
//  Copyright © 2018年 pi. All rights reserved.
//

#import "PostTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setPost:(Post *)post
{
    [self.postImage sd_setImageWithURL:[NSURL URLWithString:[self getimageString:post.src]]];
    [self.posttitleLabel setText:post.title];
    [self.detailLabel setText:post.alt];
}
- (NSString*)getimageString:(NSString*)imageString
{
    NSArray *array  =   [imageString componentsSeparatedByString:@"&"];
    return [[[array objectAtIndex:0] componentsSeparatedByString:@"="] objectAtIndex:1];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
