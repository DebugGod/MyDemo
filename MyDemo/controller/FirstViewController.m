//
//  FirstViewController.m
//  UseCoreData
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//
#define kUIScreenWidth          [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight         [UIScreen mainScreen].bounds.size.height
#define K_url  @"http://192.163.31.163:3000/api/games/rooms"
#import "FirstViewController.h"
#import "CtrHelps.h"
#import "ImageScrollView.h"
#import "FirstTableViewCell.h"
#import "ZYHttpTool.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "CharttingViewController.h"
@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *roomArr;
@end

@implementation FirstViewController
- (NSMutableArray *)roomArr {
    if (!_roomArr) {
        self.roomArr = [NSMutableArray arrayWithCapacity:1];
    }
    return _roomArr;
}
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kUIScreenWidth ,kUIScreenHeight - 44) style:UITableViewStylePlain];
    }
    return _mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [CtrHelps colorWithHexString:@"#FFFFFF"];
    [self setNav];
    [self reuqstRoomListAPI];
    [self setTableView];
    [self setTableHeaderWithImageDict:nil];

}
- (void)setNav {
    self.title = @"加拿大28";
}
- (void)reuqstRoomListAPI {
//    NSString *urlStr = [@"http://192.163.31.163:3000/api/games/1/rooms?" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"page",nil];
    [ZYHttpTool getWithURL:@"http://192.163.31.163:3000/api/games/1/rooms?" params:paramsDict success:^(id json) {
        NSLog(@"%@",json);
    } failure:^(NSError *error) {

    }];
}
- (void)setTableView {
    [self.view addSubview:self.mainTableView];
    self.mainTableView.backgroundColor = [CtrHelps colorWithHexString:@"#EFEFEF"];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.pagingEnabled = NO;
    [self.mainTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"sirhu"];
 
}
- (void)setTableHeaderWithImageDict:(NSDictionary *)dict {
    __weak __typeof(&*self)weakSelf = self;
    ImageScrollView *cycleScrollView = [[ImageScrollView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenWidth *0.5)];
    
    cycleScrollView.pics = @[@"1",@"2",@"3",@"4"];
    
    cycleScrollView.pageColor = [CtrHelps colorWithHexString:@"999999"];
    cycleScrollView.pageSelColor = [CtrHelps colorWithHexString:@"FF6600"];
    cycleScrollView.isTimer = YES;
    cycleScrollView.imgViewSelectBlock = ^(NSInteger index) {
        //处理点击事件
        [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%ld",index]];
    };
    [cycleScrollView reloadView];
    self.mainTableView.tableHeaderView = cycleScrollView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sirhu" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CharttingViewController *chartVC = [CharttingViewController new];
    chartVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chartVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
