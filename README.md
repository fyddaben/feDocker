# feDocker: v1.3.1

> 简单配置一个前端开发环境所需要的docker

### 配置内容

- supervisor(用于启动多项应用)

- nginx(默认指向/home/data)

- ssh

- vim (安装了基本的bundle包管理器和一个color-scheme包)

- node && npm (包管理工具)

- gulp (前端编译工具)

- grunt(前端编译工具)

- sass(`css` 预编译语言) 

- ruby(`sass` 需要ruby编译环境) 


### 建立镜像
```
docker build -t fe_docker:v1.3.1 .
```

### 运行一个容器

```
docker run -d -t -i -p 22 -p 80:80  -v /Users/Shared/work:/home/data  --name fe_container  fe_docker:v1.3.1
```
- `/Users/daben/work` 表示宿主机的共享目录。
- 注意： `mac`电脑或者`win`电脑，由于需要安装`docker` 的运行环境[boot2docker](https://docs.docker.com/installation/mac/) , 而`boot2docker`和宿主机的默认共享目录为`/Users/`.所以这里，最好写`/Users/`下的某个文件夹，作为共享目录


- `/home/data`为容器中的共享目录

- `80`端口为 `nginx`  代理使用
- `22` 端口为`ssh`连接使用


### `ssh`连接进行深入操作
```
docker ps 
```
可以看到
```
e1dafad42ce9        fe_docker:v1.3.1    "/usr/bin/supervisor   27 minutes ago      Up 27 minutes       0.0.0.0:80->80/tcp, 0.0.0.0:32769->22/tcp   fe_container
```
####其中`container`的`22`端口被随机对应了`boot2docker`的`32769`端口
```
ssh root@$(boot2docker ip) -p 32769

```
就可以进入我们新的`container`里面，进行进一步操作了。

#### 常见问题整理

1. 电脑重启后，`docker` 停掉了

记得，电脑重启后，要先,运行`boot2docker up`


2. 不同的Terminal窗口打开，`docker ps `报错

我用`zsh`,因此在`.zshrc`里面配置 `$(boot2docker shellinit 2> /dev/null)`

就是在命令窗口打开的初始化配置文件里面，添加`boot2docker`的初始化语句










