//
//  CharttingViewController.m
//  UseCoreData
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//

#import "CharttingViewController.h"
#import "ChartTableViewCell.h"
#import "CtrHelps.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#define kUIScreenWidth          [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight         [UIScreen mainScreen].bounds.size.height
@interface CharttingViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
 
@end

@implementation CharttingViewController
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kUIScreenWidth ,kUIScreenHeight - 88) style:UITableViewStylePlain];
    }
    return _mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setNav];
    [self setTableView];
    [self addAllButtons];
}
- (void)setNav {
    self.title = @"加拿大28";
}
- (void)addAllButtons {
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, kUIScreenHeight - 88, kUIScreenWidth, 88)];
    downView.backgroundColor = [CtrHelps colorWithHexString:@"#FFFFFF"];
    [self.view addSubview:downView];
    
    UITextView *mainTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, kUIScreenWidth - 20, 34)];
    mainTextView.backgroundColor = [CtrHelps colorWithHexString:@"#EFEFEF"];
    [downView addSubview:mainTextView];
    
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(10 + (kUIScreenWidth - 10) / 5 * i, CGRectGetMaxY(mainTextView.frame), (kUIScreenWidth - 10) / 5, 44);
        btn.tag = 500 + i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 8, 28, 28)];
        iconImageView.backgroundColor = [UIColor redColor];
        [btn addSubview:iconImageView];
        [downView addSubview:btn];
    }
}
- (void)setTableView {
    [self.view addSubview:self.mainTableView];
    self.mainTableView.backgroundColor = [CtrHelps colorWithHexString:@"#EFEFEF"];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.pagingEnabled = NO;
    [self.mainTableView registerClass:[ChartTableViewCell class] forCellReuseIdentifier:@"sirhu"];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sirhu" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text= [NSString stringWithFormat:@"小胡%ld",indexPath.row];
    cell.digestLabel.text =  @"这真是一个不错的东西";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)btnAction:(UIButton *)sender {
    [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%ld",sender.tag - 500]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
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
