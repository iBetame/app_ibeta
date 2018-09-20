//
//  ViewController.h
//  app
//
//  Created by zhouwei on 2018/9/20.
//  Copyright © 2018年 ibetame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *articles;
@end

