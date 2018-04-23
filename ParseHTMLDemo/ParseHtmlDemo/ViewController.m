//
//  ViewController.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import <Ono.h>
#import "Post.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Post getNewPosts];
//    NSError *error = nil;
//    NSString *XMLFilePath = [[@(__FILE__) stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"nutrition.xml"];
//    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nutrition" ofType:@"xml"]];
//    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:&error];
//    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://kj.tt/"]];
//    ONOXMLDocument *document=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
//    if (error) {
//        NSLog(@"[Error] %@", error);
//    }
//
//    NSLog(@"Root Element: %@", document.rootElement.tag);
//
//    NSLog(@"\n");
//    NSLog(@"Daily Values:");
//    for (ONOXMLElement *dailyValueElement in [[document.rootElement firstChildWithTag:@"daily-values"] children]) {
//        NSString *nutrient = dailyValueElement.tag;
//        NSNumber *amount = [dailyValueElement numberValue];
//        NSString *unit = dailyValueElement[@"units"];
//        NSLog(@"- %@%@ %@ ", amount, unit, nutrient);
//    }
//
//    NSLog(@"\n");
//    NSString *XPath = @"//food/name";
//    NSLog(@"XPath Search: %@", XPath);
//    [document enumerateElementsWithXPath:XPath usingBlock:^(ONOXMLElement *element, __unused NSUInteger idx, __unused BOOL *stop) {
//        NSLog(@"%@", element);
//    }];
//
//    NSLog(@"\n");
//    NSString *CSS = @"food > serving[units]";
//    NSLog(@"CSS Search: %@", CSS);
//    [document enumerateElementsWithCSS:CSS usingBlock:^(ONOXMLElement *element, __unused NSUInteger idx, __unused BOOL *stop) {
//        NSLog(@"%@", element);
//    }];
//
//    NSLog(@"\n");
//    XPath = @"//food/name";
//    NSLog(@"XPath Search: %@", XPath);
//    __block ONOXMLElement *blockElement = nil;
//    [document enumerateElementsWithXPath:XPath usingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *stop) {
//        *stop = idx == 1;
//        if (*stop) {
//            blockElement = element;
//        }
//    }];
//    NSLog(@"Second element: %@", blockElement);
//
//    NSLog(@"\n");
//    XPath = @"//food/name";
//    NSLog(@"XPath Search: %@", XPath);
//    ONOXMLElement *firstElement = [document firstChildWithXPath:XPath];
//    NSLog(@"First element: %@", firstElement);

}

@end
