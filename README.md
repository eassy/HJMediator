# HJMediator
最近结合自己的项目，创建了一个简单的跳转页面中介者框架。

## 前言

项目最开始没有用到中介者模式跳转页面，结果跳转代码东一丢西一丢，显得特别乱，到了后来我们做埋点，做 Hybird ，会感到很绝望，每个跳转的地方都需要添加同样的代码块，几次也因为遗漏掉某个地方出现了 bug 。

我们使用中介者模式进行页面创建，跳转，一方面能进行页面解耦，另一方面也可以在入口做一些统一的逻辑判断、处理，甚至对于以后的组件化开发，也提供了一个很好的接入口。下面是我的一些思路：

1. 支持对于不同 VC 进行个性化的初始化。
2. 允许 VC 发出回调给回调者。
3. 允许外部调用 VC 的方法。

以上是我觉得这个框架需要满足的几个需求，当然，在实际开发中，包括但不仅限于这几个需求，我认为一个适合大家自己项目的框架才是好框架。

## 类图

这是框架的类图，很简单的两个类：
[image 类图](https://github.com/eassy/LibraryImgs/blob/master/HJMediatorManager/WechatIMG42.jpeg)

HJMediatorManager 类，负责具体的跳转逻辑，跳转方法还可以扩展，比如入参可以增加跳转动画类型等参数。

VCMediator 类，负责生成具体的 ViewController ，并在内部保持一个 ViewController 的引用，并支持通过 VCMediator 对 ViewController 进行方法调用。VCMediator 初始化的时候，内部其实是通过运行时，生成并返回的具体的子类，通过这样， ViewController 不需要知道具体的子类，从而实现了解耦。

## 使用方法
我们每次创建一个 ViewController ，都对应的创建一个 VCMediator 子类，这个子类负责实现具体的 ViewController 生成方法：

```
- (BaseVC *)setTargetVCParameters:(id)parameters
{
    /// 在这个方法内做 VC 的具体初始化
    VCA *vc = [[VCA alloc] initWithName:parameters[@"name"]];
    return vc;
}
```
这个方法需要子类去实现，因为不同的 VC ，可能有不同的初始化方法，没法在 父类 VCMediator 中去做统一处理，或者真的有办法去做统一处理，但是为了体现出我们的解耦操作，或者以后单独对某个 VC 进行相应的处理，我觉得有必要单独生成一个子类。

在操作 push ViewController 时，通过对 Mediator 进行操作，实现页面的跳转:

```
VCMediator *mediator = [VCMediator VCMediatorWithName:@"A" parameters:nil];
if (indexPath.row == 0) {
    [HJMediatorManager pushVCWithMediator:mediator navController:self.navigationController];
    
}
else
{
    [HJMediatorManager presentVCWithMediator:mediator mainController:self];
}
    
```

## More

框架里只是简单的逻辑，体现了一下思路，具体的细节处理还差很多，比如各种错误判空处理，比如我们针对 VC 的初始化，还可以做一个统一的入口逻辑处理等等，总之，这是一个还需要按自己的需求去完善的框架。
