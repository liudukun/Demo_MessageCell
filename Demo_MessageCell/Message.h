//
//  Message.h
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageModel.h"


@interface Message : NSObject

@property (nonatomic) int ID;

@property (nonatomic,strong) MessageModel *messageItem;

@property (nonatomic,strong) UserItem * userItem;

@property (nonatomic) BOOL send;

@property (nonatomic) BOOL isGroup;

@end
