//
//  MyTableViewCell.h
//  app
//
//  Created by zhouwei on 2018/9/20.
//  Copyright © 2018年 ibetame. All rights reserved.
//

#ifndef MyTableViewCell_h
#define MyTableViewCell_h

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,retain) UILabel *author;

@property (nonatomic,retain) UILabel *title;

@property (nonatomic,retain) UILabel *summary;

- (void) setAuthor:(NSString *)author title:(NSString *)title summary:(NSString*)summary;

@end



#endif /* MyTableViewCell_h */
