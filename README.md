#iOS开发：占位图的实现（一行代码调用，无需手动隐藏显示）

![效果1.png](http://upload-images.jianshu.io/upload_images/1840399-ccf7197e3c6059a3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)     ![效果GIF.gif](http://upload-images.jianshu.io/upload_images/1840399-4adeff943e66157b.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果`UITableView`、`UICollectionView`需要显示占位图，只需要下面一行代码调用即可

```
self.tableView.hintView = [DKSHintView showHintViewWithImageStr:@"noData" titleStr:@"暂未获取到相关数据" btnTitleStr:@"重新加载" target:self action:@selector(loadData)];
```

无需手动管理隐藏机制，工程中已经实现在`reloadData`、`insert`、`delete`时判断当前页面的数据是否为0，为0则显示，否则隐藏；

下面是占位图提供的一些方法，可根据具体情况使用

```
#import <UIKit/UIKit.h>

@interface DKSHintView : UIView

/**
 是否自动显示占位图，默认YES
 */
@property (nonatomic, assign) BOOL autoShowHintView;

/**
 总的方法，如果不显示某个控件，只需传入nil即可

 @param imageStr 图片名称
 @param titleStr 提示文案
 @param btnTitleStr 按钮文案
 @param target 相应事件的对象
 @param action 相应事件的方法
 @return 返回一个占位图
 */
+ (instancetype)showHintViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action;
```

.m实现方法如下：

```
#pragma mark ====== 总的方法 ======
+ (instancetype)showHintViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action {
    DKSHintView *hintView = [[self alloc] init];
    [hintView showHintViewWithImageStr:imageStr titleStr:titleStr btnTitleStr:btnTitleStr target:target action:action];
    return hintView;
}

#pragma mark ====== 共同处理 ======
- (void)showHintViewWithImageStr:(NSString *)imgStr titleStr:(NSString *)titleStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action {
    //图片显示
    if (imgStr.length > 0) {
        UIImage *img = [UIImage imageNamed:imgStr];
        self.hintImage.image = img;
        CGFloat imgViewWidth = img.size.width;
        CGFloat imgViewHeight = img.size.height;
        if (imgViewWidth > imgViewHeight) {
            imgViewHeight = (imgViewHeight / imgViewWidth) * imgWidth;
            imgViewWidth = imgWidth;
        } else {
            imgViewWidth = (imgViewWidth / imgViewHeight) * imgWidth;
            imgViewHeight = imgWidth;
        }
        self.hintImage.frame = CGRectMake(0, 0, imgViewWidth, imgViewHeight);
        contentHeight = imgViewHeight;
        contentWidth = imgViewWidth;
    }
    //提示文字
    if (titleStr.length > 0) {
        self.hintLabel.text = titleStr;
        CGSize size = [self returnTextWidth:titleStr size:CGSizeMake(1000, labelHeight)];
        contentHeight = contentHeight ? contentHeight + margin : contentHeight;
        self.hintLabel.frame = CGRectMake(0, contentHeight, size.width, labelHeight);
        contentHeight = CGRectGetMaxY(self.hintLabel.frame);
        contentWidth = contentWidth > size.width ? contentWidth : size.width;
    }
    //按钮信息
    if (btnTitleStr.length > 0) {
        [self.hintBtn setTitle:btnTitleStr forState:UIControlStateNormal];
        contentHeight = contentHeight ? contentHeight + margin : contentHeight;
        self.hintBtn.frame = CGRectMake(0, contentHeight, btnWidth, btnHeight);
        contentHeight = CGRectGetMaxY(self.hintBtn.frame);
        contentWidth = contentWidth > btnWidth ? contentWidth : btnWidth;
        //给按钮添加方法
        if (target && action) {
            [self.hintBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
    }
    CGRect viewFrame = self.frame;
    viewFrame.size = CGSizeMake(contentWidth, contentHeight);
    self.frame = viewFrame;
}
```
上面列出的主要是方法的实现及布局，也是工程中的主要代码

```
- (void)layoutSubviews {
    [super layoutSubviews];
    self.centerX = self.superview.width * 0.5;
    self.centerY = self.superview.height * 0.5;
    CGFloat centerX = self.width * 0.5;
    self.hintImage.centerX = centerX;
    self.hintLabel.centerX = centerX;
    self.hintBtn.centerX = centerX;
}
```
上面这段代码，主要是为了使显示的控件居中显示

自动处理显示、隐藏的方法，主要是实现了`UIScrollView`的分类，这里就不在列出具体的实现过程了，代码量也不多，有兴趣的同学可下载参考一下；


>一直想要封装一个占位图的功能，2017-12-28，网上看到了一篇[好的文章](https://www.jianshu.com/p/b268e1985adf)，经过一番研究，自动也手动的敲了一篇，过程中也学到了一些东西，想着是给2017年画个句号，也算是2017年的最后一篇文章了，所以在31号晚上8点钟，更新了一个半成品😂；2018年第一天上班，赶紧把剩下工作收尾，也算是2018的一个好的开始吧。同时也希望大家在2018年，小的目标顺利实现，大的愿望顺利发展，祝愿大家新的一年：工作顺利！！！幸福生活！！！