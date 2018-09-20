//
//  ViewController.m
//  app
//
//  Created by zhouwei on 2018/9/20.
//  Copyright © 2018年 ibetame. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "AFNetworking.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    if(self.tableView==nil){
        self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    
    [self requestServer];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.articles!=nil)
        return [self.articles count];
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if(cell==nil){
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    NSDictionary *article = [self.articles objectAtIndex:indexPath.row];
    
    NSString *author = [article objectForKey:@"author"];
    if((NSNull *)author == [NSNull null])author = @"空";
    
    NSString *title = [article objectForKey:@"title"];
    if((NSNull *)title == [NSNull null])title = @"空";
    
    NSString *summary = [article objectForKey:@"summary"];
    if((NSNull *)summary == [NSNull null])summary = @"空";
    
    [cell setAuthor:author title:title summary:summary];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (void) requestServer {
    [[AFHTTPSessionManager manager]
     GET:@"https://api.ibeta.me/articles"
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask * task, id responseObject){
         NSLog(@"Success %@", responseObject);
         self.articles = (NSArray*)responseObject;
         [self.tableView reloadData];
     }
     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"Error: %@", error);
     }];
}

@end
