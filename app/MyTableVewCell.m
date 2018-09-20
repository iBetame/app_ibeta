//
//  UITableViewCell+MyTableVewCell.h
//  app
//
//  Created by zhouwei on 2018/9/20.
//  Copyright © 2018年 ibetame. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    self.title = [[UILabel alloc] init];
    self.title.translatesAutoresizingMaskIntoConstraints = NO;
    //self.title.backgroundColor = [UIColor blueColor];
    [self.title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self addSubview:self.title];
    
    self.author = [[UILabel alloc] init];
    self.author.translatesAutoresizingMaskIntoConstraints = NO;
    //self.author.backgroundColor = [UIColor redColor];
    [self.author setTextColor:[UIColor grayColor]];
    [self addSubview:self.author];
    
    self.summary = [[UILabel alloc] init];
    self.summary.translatesAutoresizingMaskIntoConstraints = NO;
    //self.summary.backgroundColor = [UIColor greenColor];
    [self addSubview:self.summary];
    
    [self addVFL:@"V:|-space-[title(20)]-space-[author(20)]-space-[summary(20)]"];
    [self addVFL:@"H:|-space-[author]-space-|"];
    [self addVFL:@"H:|-space-[title]-space-|"];
    [self addVFL:@"H:|-space-[summary]-space-|"];
    
    return self;
}

- (void) addVFL:(NSString *)vfl{

    NSDictionary *views = @{@"author":self.author,
                            @"title":self.title,
                            @"summary":self.summary};

    NSDictionary *metrics = @{@"space":@10};
    
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:vfl
                          options:kNilOptions
                          metrics:metrics
                          views:views]];
    
}

- (void) setAuthor:(NSString *)author title:(NSString *)title summary:(NSString*)summary{
    self.author.text = author;
    self.title.text = title;
    self.summary.text = summary;
}

@end

