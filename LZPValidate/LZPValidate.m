//
//  LZPValidate.m
//  LZPValidate
//
//  Created by scjy on 16/4/8.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZPValidate.h"

@implementation LZPValidate
+ (BOOL)validateEmail:(NSString *)email{
    //判断是否是邮箱
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //    NSString *emailRegex = @"/\w+@\w+\.(com|net|org|edu)/i";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+ (BOOL)validatePhoneNumber:(NSString *)phoneNumber
{
    if (phoneNumber.length < 11) {
        return NO;
    }else{
        //移动号段正确表达式
        NSString *CM_NUM = @"^((13[49])|(147)|(15[02,79])|(178)|(18[24,78]))\\d{8}|(1705)\\d{7}$";
        //联通号段正确表达式
        NSString *CU_NUM = @"^((13[02])|(145)|(15[56])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        //电信号段正确表达式
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:phoneNumber];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:phoneNumber];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:phoneNumber];
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }
        return NO;
    }
    return NO;
}
@end
