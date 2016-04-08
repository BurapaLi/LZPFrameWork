//
//  LZPValidate.h
//  LZPValidate
//
//  Created by scjy on 16/4/8.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZPValidate : NSObject
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validatePhoneNumber:(NSString *)phoneNumber;

@end
