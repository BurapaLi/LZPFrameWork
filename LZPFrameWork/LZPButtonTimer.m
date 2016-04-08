//
//  LZPButtonTimer.m
//  Framework
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZPButtonTimer.h"

@interface LZPButtonTimer ()

@end

@implementation LZPButtonTimer

+ (void)buttonWithTimerButton:(UIButton *)btn TimeOut:(NSInteger )timeOut timeOutRem:(NSInteger )timeOutRem{
    __block NSInteger timeout = timeOut; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor orangeColor];
                btn.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            NSInteger seconds = timeout % timeOutRem;
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long)seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                [btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor grayColor];
                btn.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
        
    });
    
    dispatch_resume(_timer);
    
}

@end
