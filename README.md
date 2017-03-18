# DWQRuntime_3_DynamicAddMethod
Runtime动态添加方法的简单实现
![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-1545493cd60adb2b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##引述
  在我们的iOS开发过程中，如果一个类方法非常多，加载类到内存的时候也比较耗费资源，需要给每个方法生成映射表，可以使用动态给某个类，添加方法解决。做到优化内存，节省资源的效果。

##Runtime动态添加方法
  动态给某个类添加方法的步骤，假如我们定义一个Cat类，给他动态添加一个eat的方法。
- 1.动态添加方法,首先实现这个resolveInstanceMethod
 resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
 resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
 sel:没有实现方法
- 2.然后调用 class_addMethod方法，参数解释：
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名
         types:方法类型   可查看官方文档查询：Type Encodings

```objective-c
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //    NSLog(@"%@",NSStringFromSelector(sel));
    // 动态添加eat方法
    
    if (sel == @selector(eat:)) {
        /*
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名，需要定义一个函数，也就是方法的实现部分
         types:方法类型,如何知道类型，
         */
        // @:对象 :SEL
        class_addMethod(self, sel, (IMP)eatFunc, "v@:@");    
        // 处理完
        return YES；
    }
    
    return [super resolveInstanceMethod:sel];
}

```
- 3.在需要的地方动态添加方法,先引用头文件，然后通过performSelector调用方法

![dynamicADD.png](http://upload-images.jianshu.io/upload_images/2231137-6a5262f541e930f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)

