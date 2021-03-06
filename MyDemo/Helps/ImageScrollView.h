
 
#import <UIKit/UIKit.h>

typedef void (^scrollViewSelectBlock)(NSInteger index);

@interface ImageScrollView : UIView

/** 图片路径数组 **/
@property (strong, nonatomic) NSArray *pics;
/** pageControl 颜色 **/
@property (strong, nonatomic) UIColor *pageColor;
@property (strong, nonatomic) UIColor *pageSelColor;
@property (nonatomic, copy) scrollViewSelectBlock imgViewSelectBlock; // 图片点击事件
@property (nonatomic, assign) BOOL isTimer;
- (void)returnIndex:(scrollViewSelectBlock)block; //代码块回调

/** 赋值以后，调用此方法刷新视图 **/
- (void) reloadView;
- (void)stopTimer:(BOOL)stopTimer;
@end
