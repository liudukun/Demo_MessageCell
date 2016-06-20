//
//  MessageItem.m
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import "MessageItem.h"
#import "MessageModel.h"

#define LineHeight 40.f
#define AvatarHeight 40.f

@interface MessageItem ()
{
    CGRect curRect;
    CGContextRef ctx;
    CGFloat maxWidth;
    NSDictionary * textAttributes;
}
@end

@implementation MessageItem


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        maxWidth = [UIScreen mainScreen].bounds.size.width / 10* 8;
        textAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f],NSForegroundColorAttributeName:[UIColor grayColor],NSBackgroundColorAttributeName:[UIColor clearColor]};
        
    }
    return self;
}

-(void)setMessage:(Message *)message{
    _message = message;
    
    [self addCustumView];

}

- (void)addCustumView{
    [self addBackGroundView];
    //首先判断 是不是发送方
    if(self.message.send){
        //发送消息
        //add message
        [self addMessage];
        //add big separator  1/5 width
        
    }else{
        //接收消息 反向添加
        //add separator
        
        //add avator
        
        //add separator
        
        //add message
        
        //add big separator  1/5 width
        
    }
    
    
    self.lastSize = curRect.size;
    
}

- (void)addBackGroundView{
    self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(AvatarHeight+16, 8, maxWidth, 0)];
    self.backgroundView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.backgroundView.layer.cornerRadius = 5.f;
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.borderWidth = 1.f;
    self.backgroundView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self addSubview:self.backgroundView];
}

- (void)addMessage{
    MessageModel * item = self.message.messageItem;
    if (item.type==MessageTypeText) {
        TextMessage * itemText = (TextMessage*)item;
        [self drawText:itemText.text];
    }else if (item.type==MessageTypePicture) {
        PictureMessage * itemPic = (PictureMessage*)item;
        [self drawPicture:itemPic.image];
    }else if (item.type==MessageTypeVideo) {
        VideoMessage * itemVideo = (VideoMessage*)item;
        [self drawVideo:itemVideo.videoURL];
    }
    
}

//添加文本
- (void)drawText:(NSString*)text{
    
    CGRect bound =[text boundingRectWithSize:CGSizeMake(maxWidth, LineHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil];
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(8+8+AvatarHeight, 8+8+AvatarHeight, bound.size.width, bound.size.height)];
    [self addSubview:self.textLabel];
}

//添加图片
- (void)drawPicture:(UIImage*)image{
    
    CGFloat imageWidth = image.size.width;
    CGSize imageSize = image.size;
    if (imageSize.width >= maxWidth) {
        imageWidth = maxWidth;
    }
    CGFloat imageHeight = imageSize.height/image.size.width*imageWidth;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8+8+AvatarHeight, 8+8+AvatarHeight,imageWidth,imageHeight)];
    [self addSubview:imageView];
}

//添加视频
- (void)drawVideo:(NSURL*)url{
    AVAsset * asset = [AVAsset assetWithURL:url];
    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
    if([tracks count] > 0) {
        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
        NSLog(@"=====video  width:%f===height:%f",videoTrack.naturalSize.width,videoTrack.naturalSize.height);
        CGFloat videoWidth = videoTrack.naturalSize.width;
        if (videoWidth>=maxWidth) {
            videoWidth = maxWidth;
        }
        CGFloat videoHeight = videoTrack.naturalSize.height/videoTrack.naturalSize.width*maxWidth;
        AVPlayerItem *playerItem=[AVPlayerItem playerItemWithAsset:asset];
        if (!self.player) {
            self.player=[AVPlayer playerWithPlayerItem:playerItem];
        }
        //创建播放器层
        AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
        playerLayer.frame= CGRectMake(curRect.origin.x, curRect.origin.y,videoWidth, videoHeight);
        
        [self.layer addSublayer:playerLayer];
        [self.player play];
    }
    
}




@end
