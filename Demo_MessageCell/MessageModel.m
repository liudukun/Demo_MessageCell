//
//  MessageModel.m
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

@end


@implementation TextMessage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = MessageTypeText;
    }
    return self;
}

@end

@implementation PictureMessage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = MessageTypePicture;
    }
    return self;
}

@end

@implementation VideoMessage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = MessageTypeVideo;
    }
    return self;
}

@end

@implementation UserItem


@end