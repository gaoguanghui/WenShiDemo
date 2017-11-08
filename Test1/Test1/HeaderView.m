//
//  HeaderView.m
//  Test1
//
//  Created by jinjin on 17/9/8.
//  Copyright © 2017年 jinjin. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIPanGestureRecognizer * pan;
@end
@implementation HeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
//    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//    pan.delegate = self;
//    pan.cancelsTouchesInView = NO;
//    [self addGestureRecognizer:pan];
//    _pan = pan;
//    NSLog(@"====== %@", self.superview);
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
//    tap.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tap];
    
}
- (void)tapAction:(UIPanGestureRecognizer *)pan{
    NSLog(@"===taptap");
}
- (void)panAction:(UIPanGestureRecognizer *)pan{
//    NSLog(@"====== %@", self.superview);
//    NSLog(@"++++++++++");
    
    CGPoint locationPoint = [pan locationInView:self];
//    NSLog(@"AAAAAAAAAAAA %@", NSStringFromCGPoint(locationPoint));
    BOOL ishorzon = NO;
    CGFloat x = [pan translationInView:self].x;
    CGFloat y = [pan translationInView:self].y;
    if (fabs(x) > fabs(y)) {
        //水平拖动
        ishorzon = YES;
    }else if (fabs(x) < fabs(y)){
        //上下拖动
        ishorzon = NO;
        UITableView * tableView = (UITableView *)self.superview;
        for (UIGestureRecognizer * gesture in tableView.gestureRecognizers) {
            if ([gesture isEqual:_pan]) {
//                NSLog(@"HHHHHHHHHHHHHH");
//                [tableView removeGestureRecognizer:_pan];
//                _pan = nil;
            }
        }
    }
    
//    switch (pan.state) {
//        case UIGestureRecognizerStateBegan:
//            if (ishorzon) {
//                NSLog(@"AAAAAAAAAAAAAAAAA");
//            }else{
//                NSLog(@"XXXXXXXXXXXXXXXXXX");
//            }
//            break;
//        case UIGestureRecognizerStateChanged:
//            if (ishorzon) {
//                NSLog(@"BBBBBBBBBBBBBBBBBB");
//            }else{
//                NSLog(@"YYYYYYYYYYYYYYYYYYYY");
//            }
//            break;
//        case UIGestureRecognizerStateEnded:
//            if (ishorzon) {
//                NSLog(@"CCCCCCCCCCCCCCCCC");
//            }else{
//                NSLog(@"ZZZZZZZZZZZZZZZZZ");
//            }
//            break;
//        default:
//            break;
//    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        return YES;
//    }
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"ZZZZZZZZZZZZZbegin");
//    UITouch * touch = touches.anyObject;
//    CGPoint orgPoint = [touch previousLocationInView:self];
//    CGPoint currentPoint = [touch locationInView:self];
//    CGPoint  dd=[touch preciseLocationInView:self];
//    NSLog(@"ZZZZZZZZZZZZZbegin= orgPoint=%@, currentPoint=%@, dd=%@", NSStringFromCGPoint(orgPoint), NSStringFromCGPoint(currentPoint), NSStringFromCGPoint(dd));
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"ZZZZZZZZZZZZZZcancel");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"ZZZZZZZZZZZZZZend");
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = touches.anyObject;
    CGPoint orgPoint = [touch previousLocationInView:self];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint  dd=[touch preciseLocationInView:self];
    NSLog(@"ZZZZZZZZZZZZZbegin= orgPoint=%@, currentPoint=%@, dd=%@", NSStringFromCGPoint(orgPoint), NSStringFromCGPoint(currentPoint), NSStringFromCGPoint(dd));
//    NSLog(@"ZZZZZZZZZZZZZZZZtouch");
}

@end
