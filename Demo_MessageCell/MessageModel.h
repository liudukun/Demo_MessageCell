//
//  MessageModel.h
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MessageTypeText,
    MessageTypePicture,
    MessageTypeVideo,
} MessageType;


@interface MessageModel : NSObject

@property (nonatomic) MessageType type;

@end


@interface TextMessage : MessageModel

@property (nonatomic,strong) NSString *text;

@end

@interface PictureMessage : MessageModel

@property (nonatomic,strong) NSString *imageURL;

@property (nonatomic,strong) UIImage * image;

@end

@interface VideoMessage : MessageModel

@property (nonatomic,strong) NSURL *videoURL;

@end

@interface UserItem : NSObject

@property (nonatomic,strong) UIImage * headImage;
@property (nonatomic,strong) NSURL * avatarURL;
@property (nonatomic,strong) NSString * nickName;
@property (nonatomic) NSUInteger userID;


@end