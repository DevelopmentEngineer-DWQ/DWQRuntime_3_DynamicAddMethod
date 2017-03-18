//
//  Cat.m
//  DWQRuntimeDynamicAddMethod
//
//  Created by 杜文全 on 17/3/18.
//  Copyright © 2017年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "Cat.h"
#import <objc/message.h>
@implementation Cat
// 动态添加方法,首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
// resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
// sel:没有实现方法

// 定义函数
// 没有返回值,参数(id,SEL)
// void(id,SEL)
void eatFunc(id self, SEL _cmd, id num)
{
    
    NSLog(@"调用eat %@ %@ %@",self,NSStringFromSelector(_cmd),num);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //    NSLog(@"%@",NSStringFromSelector(sel));
    // 动态添加eat方法
    
    if (sel == @selector(eat:)) {
        /*
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名
         types:方法类型   可查看官方文档查询：Type Encodings
         */
        // @:对象 :SEL
        class_addMethod(self, sel, (IMP)eatFunc, "v@:@");
        
        // 处理完
        return YES;
        
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
