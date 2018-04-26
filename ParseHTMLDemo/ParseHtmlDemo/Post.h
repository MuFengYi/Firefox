//
//  Post.h
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
#import "Ono.h"
#import "WebParseObject.h"
@interface Post : NSObject
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *href;
@property (copy,nonatomic) NSString *alt;
@property (copy,nonatomic) NSString *src;
+(NSArray*)getNewPosts:(WebParseObject*)webparseObject;
+ (NSArray*)getVideourl:(WebParseObject*)webparseObject;
@end
