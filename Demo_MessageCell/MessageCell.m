//
//  MessageCell.m
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/16.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell


- (MessageCell*)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [self initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return <#expression#>

}


////添加用户头像
//- (void)addFrom:(UserItem*)item{
//    self.avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(8,8, AvatarHeight, AvatarHeight)];
//    self.avatarView.layer.cornerRadius = AvatarHeight/2;
//    self.avatarView.layer.masksToBounds = YES;
//    [self addSubview:self.avatarView];
//    self.avatarView.image = item.headImage;
//    
//    if (self.message.isGroup) {
//        UILabel * name = [[UILabel alloc]initWithFrame:CGRectMake(8+8+AvatarHeight, 8, maxWidth, 40.0/3)];
//        name.text = item.nickName;
//        name.font = [UIFont systemFontOfSize:12.f];
//        [self addSubview:name];
//    }
//    
//    
//}
//
//

@end
