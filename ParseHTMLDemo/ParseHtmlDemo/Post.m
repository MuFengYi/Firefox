//
//  Post.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Post.h"


static NSString *const kUrlStr=@"http://www.wearesellers.com/article/";

@implementation Post
+(NSArray*)getNewPosts
{
    NSMutableArray *array=[NSMutableArray array];
    NSMutableDictionary     *mutableDictionary  =   [NSMutableDictionary dictionary];
    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrlStr]];
    NSError *error;
    ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
    ONOXMLElement *postsParentElement= [doc firstChildWithXPath:@"//*[@class='bus_viewthread_c']"];
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop)
     {
             [element enumerateElementsWithXPath:@"//*[@class='content_body']" usingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *stop) {
                 NSLog(@"YY==%@",element.attributes);
                 [element.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop)
                  {
                     NSLog(@"oo==%@",element.attributes);
                      [mutableDictionary addEntriesFromDictionary:element.attributes];
                      [element.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop)
                       {
                           NSLog(@"element.tag==%@",element.attributes);
                           [mutableDictionary addEntriesFromDictionary:element.attributes];
                           Post    *post   =   [Post   yy_modelWithDictionary:mutableDictionary];
                           if (post)
                           {
                               [array addObject:post];
                           }
                       }];
                 }];
             }];
     }];
    return array;
}



@end
