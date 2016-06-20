//
//  MessageItem.h
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "UIView+HandyAutoLayout.h"
#import <AVFoundation/AVFoundation.h>


@interface MessageItem : UIView

@property (nonatomic,strong) Message *message;

@property (nonatomic,strong) UIImageView *avatarView;

@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,strong) AVPlayer *player;

@property (nonatomic) CGSize lastSize;

@property (nonatomic,strong) UILabel *textLabel;

@end
