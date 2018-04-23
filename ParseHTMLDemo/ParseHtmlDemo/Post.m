//
//  Post.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Post.h"
#import <Ono.h>

static NSString *const kUrlStr=@"http://kj.tt/";

@implementation Post
+(NSArray*)getNewPosts
{
    NSMutableArray *array=[NSMutableArray array];
    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrlStr]];
    
    NSError *error;
    ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
//    NSLog(@"doc==%@",doc);
    for (ONOXMLElement *element in doc.rootElement.children)
    {
//        NSLog(@"element.tag==%@\nelement.attributes==%@",element.tag,element.attributes);
    }
    ONOXMLElement *postsParentElement= [doc firstChildWithXPath:@"//*[@class='content_body']"];
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSLog(@"mobanbus==%@",element);
//        Post *post=[Post postWithHtmlStr:element];
//        if(post)
//        {
//            [array addObject:post];
//        }
//
          NSLog(@"element.tag==%@",element.tag);
           NSLog(@"element.tag==%@",element.attributes);
        [element.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop) {
                 NSLog(@"element.tag==%@",element.tag);
                  NSLog(@"element.tag==%@",element.attributes);
        }];
    }];
    return array;
}

+(instancetype)postWithHtmlStr:(ONOXMLElement*)element
{
    Post *p=[Post new];
//    ONOXMLElement *titleElement= [element firstChildWithXPath:@"h2/a"];
//    p.postUrl= [titleElement valueForAttribute:@"href"];
//    p.title= [titleElement stringValue];
//    ONOXMLElement *dateElement= [element firstChildWithXPath:@"div[2]/span[1]"];
//    p.postDate= [dateElement stringValue];
    return p;
}

-(void)setPostUrl:(NSString *)postUrl
{
    _postUrl=[kUrlStr stringByAppendingString:postUrl];
}
@end
