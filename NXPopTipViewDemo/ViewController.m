//
//  ViewController.m
//  NXPopTipViewDemo
//
//  Created by next on 2020/9/3.
//  Copyright © 2020 next. All rights reserved.
//

#import "ViewController.h"
#import "NXPopTipView.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *ctmButton;
@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *downButton;
@property (nonatomic, strong) UIButton *timeButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NXPopTipView";
    
    self.ctmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ctmButton.tag = 1001;
    self.ctmButton.backgroundColor = UIColor.redColor;
    self.ctmButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.ctmButton setTitle:@"custom" forState:UIControlStateNormal];
    self.ctmButton.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 96) /2, 169, 96, 28);
    [self.ctmButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.ctmButton];
    
    self.upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.upButton.tag = 1002;
    self.upButton.backgroundColor = UIColor.orangeColor;
    self.upButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.upButton setTitle:@"up" forState:UIControlStateNormal];
    self.upButton.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 96) /2, CGRectGetMaxY(self.ctmButton.frame) + 96 , 96, 28);
    [self.upButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.upButton];
    
    self.downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.downButton.tag = 1003;
    self.downButton.backgroundColor = UIColor.blueColor;
    self.downButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.downButton setTitle:@"down" forState:UIControlStateNormal];
    self.downButton.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 96) /2, CGRectGetMaxY(self.upButton.frame) + 96, 96, 28);
    [self.downButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.downButton];
    
    self.timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.timeButton.tag = 1004;
    self.timeButton.backgroundColor = UIColor.blueColor;
    self.timeButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [self.timeButton setTitle:@"5s dismiss" forState:UIControlStateNormal];
    self.timeButton.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 96) /2, CGRectGetMaxY(self.downButton.frame) + 96, 96, 28);
    [self.timeButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.timeButton];
  
}

- (void)onButtonClick:(UIButton *)sener {
    NXPopTipView *popTipView;
    if (sener.tag == 1001) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 269, 96)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.contentScaleFactor = UIScreen.mainScreen.scale;
        imageView.image = [UIImage  imageNamed:@"img_x_custom.jpg"];
        popTipView = [[NXPopTipView alloc] initWithCustomView:imageView];
        popTipView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        popTipView.cornerRadius = 2.0;
        popTipView.dismissTapAnywhere = YES;
        popTipView.animation = arc4random() % 2;
        popTipView.has3DStyle = (BOOL)(arc4random() % 2);
        [popTipView presentPointingAtView:sener inView:self.view animated:YES];
        
    } else if (sener.tag == 1002) {
        popTipView = [[NXPopTipView alloc] initWithTitle:@"爱因斯坦" message:@"没有侥幸这回事，最偶然的意外，似乎也都是有必然性的"];
        popTipView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        popTipView.titleFont = [UIFont systemFontOfSize:15];
        popTipView.textFont = [UIFont systemFontOfSize:13];
        popTipView.cornerRadius = 2.0;
        popTipView.dismissTapAnywhere = YES;
        popTipView.titleColor = UIColor.blackColor;
        popTipView.textColor = UIColor.redColor;
        popTipView.animation = arc4random() % 2;
        [popTipView presentPointingAtView:sener inView:self.view animated:YES];

    } else if (sener.tag == 1003){
        popTipView = [[NXPopTipView alloc] initWithMessage:@"没有侥幸这回事，最偶然的意外，似乎也都是有必然性的"];
        popTipView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        popTipView.preferredPointDirection = PointDirectionDown;
        popTipView.sidePadding = 15;
        popTipView.pointerSize = 4.0;
        popTipView.cornerRadius = 2.0;
        popTipView.dismissTapAnywhere = YES;
        popTipView.animation = arc4random() % 2;
        popTipView.has3DStyle = false;
        [popTipView presentPointingAtView:sener inView:self.view animated:YES];
    } else {
        popTipView = [[NXPopTipView alloc] initWithMessage:@"没有侥幸这回事，最偶然的意外，似乎也都是有必然性的"];
        popTipView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        popTipView.sidePadding = 15;
        popTipView.pointerSize = 4.0;
        popTipView.cornerRadius = 2.0;
        popTipView.dismissTapAnywhere = YES;
        popTipView.animation = arc4random() % 2;
        popTipView.has3DStyle = false;
        [popTipView presentPointingAtView:sener inView:self.view animated:YES];
        [popTipView autoDismissAnimated:YES atTimeInterval:5];
    }
}

@end
