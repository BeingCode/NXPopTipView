//
//  NXPopTipView.h
//  ysscw_ios
//
//  Created by next on 2019/12/11.
//  Copyright © 2019 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PointDirection) {
    PointDirectionAny = 0,
    PointDirectionUp,
    PointDirectionDown,
};

typedef NS_ENUM(NSInteger, NXPopTipAnimation) {
    NXPopTipAnimationSlide = 0,
    NXPopTipAnimationPop,
    NXPopTipAnimationFade
};

@protocol NXPopTipViewDelegate;

@interface NXPopTipView : UIView

@property (nonatomic, strong)			UIColor					*backgroundColor;
@property (nonatomic, weak)				id<NXPopTipViewDelegate>	delegate;
@property (nonatomic, assign)			BOOL					disableTapToDismiss;
@property (nonatomic, assign)			BOOL					dismissTapAnywhere;
@property (nonatomic, strong)			NSString				*title;
@property (nonatomic, strong)			NSString				*message;
@property (nonatomic, strong)           UIView	                *customView;
@property (nonatomic, strong, readonly)	id						targetObject;
@property (nonatomic, strong)			UIColor					*titleColor;
@property (nonatomic, strong)			UIFont					*titleFont;
@property (nonatomic, strong)			UIColor					*textColor;
@property (nonatomic, strong)			UIFont					*textFont;
@property (nonatomic, assign)			NSTextAlignment			titleAlignment;
@property (nonatomic, assign)			NSTextAlignment			textAlignment;
@property (nonatomic, assign)           BOOL                    has3DStyle;
@property (nonatomic, strong)			UIColor					*borderColor;
@property (nonatomic, assign)           CGFloat                 cornerRadius;
@property (nonatomic, assign)			CGFloat					borderWidth;
@property (nonatomic, assign)           BOOL                    hasShadow;
@property (nonatomic, assign)           NXPopTipAnimation       animation;
@property (nonatomic, assign)           CGFloat                 maxWidth;
@property (nonatomic, assign)           PointDirection          preferredPointDirection;
@property (nonatomic, assign)           BOOL                    hasGradientBackground;
@property (nonatomic, assign)           BOOL                    showFromCenter;
@property (nonatomic, assign)           CGFloat                 sidePadding;
@property (nonatomic, assign)           CGFloat                 topMargin;
@property (nonatomic, assign)           CGFloat                 pointerSize;
@property (nonatomic, assign)           CGFloat                 bubblePaddingX;
@property (nonatomic, assign)           CGFloat                 bubblePaddingY;

/**
 Dismiss along with user interaction if YES. For example, users can scroll down a table view when a tip view is shown. The tip view dismiss when he or she touches down and user interaction continues. Default is NO.
 @note Make sure `dismissTapAnywhere` is NO.
 */
@property (nonatomic, assign)           BOOL                    dismissAlongWithUserInteraction;
@property (nonatomic, assign)           BOOL                    shouldEnforceCustomViewPadding __attribute__((deprecated("This property is no longer required. Padding is automatically applied when using bubblePaddingX, bubblePaddingY or cornerRadius.")));
@property (nonatomic, assign)           BOOL                    shouldMaskCustomView;

/* Contents can be either a message or a UIView */
- (BOOL)isBeingShown;
- (id)initWithTitle:(NSString *)titleToShow message:(NSString *)messageToShow;
- (id)initWithMessage:(NSString *)messageToShow;
- (id)initWithCustomView:(UIView *)aView;

- (void)presentPointingAtView:(UIView *)targetView inView:(UIView *)containerView animated:(BOOL)animated;
- (void)presentPointingAtBarButtonItem:(UIBarButtonItem *)barButtonItem animated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;
- (void)autoDismissAnimated:(BOOL)animated atTimeInterval:(NSTimeInterval)timeInterval;
- (PointDirection) getPointDirection;

@end


@protocol NXPopTipViewDelegate <NSObject>
- (void)popTipViewWasDismissedByUser:(NXPopTipView *)popTipView;
@end
