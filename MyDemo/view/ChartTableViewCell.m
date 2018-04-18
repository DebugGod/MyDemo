//
//  ChartTableViewCell.m
//  UseCoreData
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//

#import "ChartTableViewCell.h"
#define kUIScreenWidth          [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight         [UIScreen mainScreen].bounds.size.height
@implementation ChartTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.digestLabel];
    }
    return self;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        self.iconImageView.layer.cornerRadius = 20.0;
        self.iconImageView.backgroundColor = [UIColor redColor];
        self.iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + 15, 0, 200, 20)];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:13.0];
        self.titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
- (UILabel *)digestLabel {
    if (!_digestLabel) {
        self.digestLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + 15, CGRectGetMaxY(self.titleLabel.frame), kUIScreenWidth - 90, 40)];
        self.digestLabel.textColor = [UIColor blackColor];
        self.digestLabel.textAlignment = NSTextAlignmentLeft;
        self.digestLabel.font = [UIFont systemFontOfSize:16.0];
    }
    return _digestLabel;
}
@end
