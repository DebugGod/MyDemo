//
//  RightChartTableViewCell.m
//  UseCoreData
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//

#import "RightChartTableViewCell.h"
#define kUIScreenWidth          [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight         [UIScreen mainScreen].bounds.size.height
@implementation RightChartTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.rightImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.digestLabel];
    }
    return self;
}
- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kUIScreenWidth - 60, 0, 40, 40)];
    }
    return _rightImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth - 70, 20)];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _titleLabel;
}
//- (UILabel *)digestLabel {
//    if (!_digestLabel) {
//        self.digestLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, , <#CGFloat width#>, <#CGFloat height#>)]
//    }
//}

@end
