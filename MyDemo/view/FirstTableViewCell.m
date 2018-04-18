//
//  FirstTableViewCell.m
//  UseCoreData
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//

#import "FirstTableViewCell.h"
#define kUIScreenWidth          [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight         [UIScreen mainScreen].bounds.size.height
#define kLeft   15.0
#import "CtrHelps.h"
@implementation FirstTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.mainImageView];
        [self.mainImageView addSubview:self.roomNameLabel];
        [self.mainImageView addSubview:self.roomPeopleLabel];
        [self.mainImageView addSubview:self.roomGuangboLabel];
    }
    return self;
}

- (UIImageView *)mainImageView {
    if (!_mainImageView) {
        self.mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kLeft, kLeft, kUIScreenWidth - kLeft *2,  (kUIScreenWidth - kLeft *2) * 0.5)];
        self.mainImageView.backgroundColor = [UIColor blueColor];
    }
    return _mainImageView;
                                                                           
}
- (UILabel *)roomNameLabel {
    if (!_roomNameLabel) {
        self.roomNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeft, kLeft, kUIScreenWidth - kLeft *4, 25)];
        self.roomNameLabel.font = [UIFont systemFontOfSize:20.0];
        self.roomNameLabel.textColor = [UIColor whiteColor];
        self.roomNameLabel.textAlignment = NSTextAlignmentLeft;
        self.roomNameLabel.text= @"房间";
    }
    return _roomNameLabel;
}
- (UILabel *)roomPeopleLabel {
    if (!_roomPeopleLabel) {
        self.roomPeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.roomNameLabel.frame), CGRectGetMaxY(self.roomNameLabel.frame)+ 10, kUIScreenWidth - kLeft *4, 25)];
        self.roomPeopleLabel.font = [UIFont systemFontOfSize:20.0];
        self.roomPeopleLabel.textColor = [UIColor whiteColor];
        self.roomPeopleLabel.textAlignment = NSTextAlignmentLeft;
        self.roomPeopleLabel.text = @"1892人在线";
    }
    return _roomPeopleLabel;
}
- (UILabel *)roomGuangboLabel {
    if (!_roomGuangboLabel) {
        self.roomGuangboLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (kUIScreenWidth - kLeft *2) * 0.5 - 25 ,  kUIScreenWidth - kLeft *2, 25)];
        self.roomGuangboLabel.backgroundColor = [CtrHelps colorWithHexString:@"#000000"];
        self.roomGuangboLabel.textColor = [UIColor whiteColor];
        self.roomGuangboLabel.font = [UIFont systemFontOfSize:13.0];
        self.roomGuangboLabel.textAlignment = NSTextAlignmentLeft;
        self.roomGuangboLabel.text = @"恭喜玩家";
    }
    return _roomGuangboLabel;
}

@end
