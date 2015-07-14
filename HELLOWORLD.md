@(学习笔记)


# 利用`Docker`+`Git`快速搭建前端开发环境

> Docker 的深入说明，可以参考[Hello Docker](http://dockone.io/article/111).这里只是个人的Docker应用理解。
## 应用场景
- 新入职人员，不熟悉团队使用工具，浪费大量时间在环境搭建
- 公司电脑为 `OS X`,家里电脑为`Win`, 环境配置不统一
- 服务端环境扩展`plugin`等，只在`Linux`等机器上可以运行，`iMac`或者`Win`系统无法兼容
- 公司团队，需要统一升级`node`或者其他环境版本，时间成本太高
-  。。。等


## 原理简单说明
- 利用`Git` 来管理代码
- 利用`Docker`来管理环境配置
###这样理解
- `Docker`根据统一的配置文件，生成一套环境，即`container`(类似一个虚拟机)
- 这个`container`里面有团队开发所需要的环境
- 在宿主机上，用`Git`管理代码，利用`Shared Folder` 跟`container`进行共享文件，进而利用`container`的环境进行编译，处理


## 对于前端代码开发的好处

- 有了`Docker`,可以把所有的环境配置，都扔到一个`container`里面
-  `OS X`或者`Win`等宿主环境， 只需要安装一个`Git`进行代码管理
- 对于前端的开发工作，可以更加集中于页面制作，逻辑书写，代码规范等更重要的地方


## 开始简单配置

###  注意
- `OSX` 系统需要安装`Boot2docker` ,一个`docker`运行的环境

####示意图展示
##### 1. 含有`Boot2docker`的系统,例如`OS X`
```flow
 
op=>operation:  宿主机
op2=>operation: Boot2docker VM  
op3=>operation: container

op->op2->op3

```
####2.`Linux` 系统
```flow
op=>operation:  宿主机
op3=>operation: container
op->op3
```

> 从示例图，可以知道，`OS X`的系统与`container` 之间隔了一个`VM`。所以接下来的，`container`的端口映射等是与`VM` 进行的


#### 配置说明

> 详细说明，请看[My Github](https://github.com/fyddaben/feDocker)

##### 配置目的
- `nginx`(用于指向代理)
- `ssh `(用于登陆调试)
- `vim`(方便`vi`更改配置文件)
- `node` && `npm` (前端最基本的包管理工具)
- `gulp` && `grunt`(前端工作流开发工具)
- `ruby` && `sass` ( `css` 预编译语言 )

#####  。。。。
通过上面的简单配置，完全可以搭建一个`干净整洁统一`的前端开发环境，如果需要`php`等环境，可以继续在`container`里面安装，然后制作为一个镜像，所有团队成员，共享同一个镜像，生成`container`,就可以了

-------------------
### 补充：使用`docker`之后的工作流

第一次安装并启动`docker`,请看[My Github](https://github.com/fyddaben/feDocker)

```
$ docker ps
```
可以看到一个正在运行的`container` ，记住`22`端口对应的`xxxxx`端口(此端口用于`SSH`连接), 准备工作ok了

- 使用`Sublime` 或者`vim` 打开本地代码(假设你的本地代码在`/Users/daben`下面)或者通过`Git` 更新本地代码。

- 打开`Terminal`,
```
$ ssh root@$(boot2docker ip) -p xxxxx
```
> xxxxx为端口号, 提示是否连接，写`yes`,提示密码，默认密码为`nicai`

默认共享目录在`/home/data`下面，对应的宿主机目录为`/Users/daben/`下面。这两个目录可以在启动`container`的时候，进行修改，详情请看[My Github](https://github.com/fyddaben/feDocker)

- 进入`/home/data`下面的任意一个前端项目中,运行`gulp`or `grunt`任务，用`Sublime`修改代码的同时，各种编译任务也可以很好的完成了。





