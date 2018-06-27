//
//  Post.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Post.h"

//static NSString *const kUrlStr=@"http://kj.tt";

@implementation Post
+(NSArray*)getNewPosts:(WebParseObject*)webparseObject
{
//    NSMutableDictionary *dict   =   [NSMutableDictionary    dictionary];
//    [dict setObject:@"auth" forKey:@"mufeng"];
//    [dict setObject:@"password" forKey:@"yi123456"];
//    [dict setObject:@"csrfKey" forKey:@"3ee59124471633c0b64337a4322c354a"];
//    [dict setObject:@"remember_me" forKey:@"1"];
//    [dict setObject:@"_processLogin" forKey:@"usernamepassword"];
//    [dict setObject:@"_processLogin" forKey:@"usernamepassword"];
//    [[HttpRequest sharedInstance] POST:@"https://iosgods.cn/index.php?/login/" dict:dict succeed:^(id data) {
//        NSString    *string =   [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"string=%@",string);
//    } failure:^(NSError *error) {
//
//    }];
    NSMutableArray *array=[NSMutableArray array];
    NSMutableDictionary     *mutableDictionary  =   [NSMutableDictionary dictionary];
    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:webparseObject.kUrlStr]];
    NSError *error;
    ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
    ONOXMLElement *postsParentElement= [doc firstChildWithXPath:webparseObject.firstXPath];
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop)
     {
             [element enumerateElementsWithXPath:webparseObject.secondXPath usingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *stop) {
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

+ (NSArray*)getVideourl:(WebParseObject*)webparseObject
{
    NSMutableArray *array=[NSMutableArray array];
    NSMutableDictionary     *mutableDictionary  =   [NSMutableDictionary dictionary];   
    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:webparseObject.kUrlStr]];
    NSError *error;
    ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
    ONOXMLElement *postsParentElement= [doc firstChildWithXPath:webparseObject.firstXPath];
    [postsParentElement enumerateElementsWithXPath:webparseObject.firstXPath usingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *stop)
     {
         NSLog(@"xx==%@",element.attributes);
         [element enumerateElementsWithXPath:webparseObject.secondXPath usingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *stop) {
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
