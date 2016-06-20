//
//  FirstViewController.m
//  Demo_MessageCell
//
//  Created by liudukun on 16/6/12.
//  Copyright © 2016年 liudukun. All rights reserved.
//

#import "FirstViewController.h"
#import "MessageItem.h"
#import "Message.h"
#import "MessageModel.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * messages;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MessageCell"];
    messages = [NSMutableArray array];
    
    //demo data
    TextMessage * text = [TextMessage new];
    text.text = @"阿斯利阿斯利康狗儿赶紧上来看vadkf阿斯利阿斯利康狗儿赶紧上来看vadkf阿斯利阿斯利康狗儿赶紧上来看vadkf阿斯利阿斯利康狗儿赶紧上来看vadkf阿斯利阿斯利康狗儿赶紧上来看vadkf阿斯利阿斯利康狗儿赶紧上来看vadkf";
    
    PictureMessage *pic = [PictureMessage new];
    pic.image = [UIImage imageNamed:@"2.png"];
    
    UserItem *user = [UserItem new];
    user.nickName = @"liudukun";
    user.headImage = [UIImage imageNamed:@"1.jpg"];
    
    Message *message = [Message new];
    message.messageItem =text;
    message.userItem = user;
    message.send = YES;
    
    Message *message1 = [Message new];
    message1.messageItem =pic;
    message1.userItem = user;
    message1.send = YES;
    
    [messages addObject:message1];
    [messages addObject:message];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate and table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return messages.count;
}
- (IBAction)actionRightSendMessage:(id)sender {
//    [self addMessage:nil];
    [self.tableView reloadData];
}

- (IBAction)actionLeftSendMessage:(UIButton *)sender {

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    MessageItem *item = [[MessageItem alloc]initWithFrame:cell.bounds];
    item.message = messages[indexPath.row];
    [cell.contentView addSubview:item];
    return cell;
}

-(void)addMessage:(Message*)message{
    [messages addObject:message];
    [self.tableView reloadData];
}


@end
