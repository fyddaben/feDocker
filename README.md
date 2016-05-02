# feDocker: v1.3.1

> 简单配置一个前端开发环境所需要的docker

### 配置内容

- supervisor(用于启动多项应用)

- nginx(默认指向/home/data)

- ssh

- vim (安装了基本的bundle包管理器和一个color-scheme包)

- node && npm (包管理工具)

- grunt(前端编译工具)

- sass(`css` 预编译语言) 

- ruby(`sass` 需要ruby编译环境) 


### 建立镜像
```
docker-compose build 
```

### 运行一个容器

```
docker-compose up -d
```
- `/Users/daben/work` 表示宿主机的共享目录。
- 暂时只能同步用户目录下的文件

- `/home/data`为容器中的共享目录

- `80`端口为 `nginx`  代理使用
- `22` 端口为`ssh`连接使用


### `ssh`连接进行深入操作
```
docker ps 
```
可以看到
```
e1dafad42ce9        fe_docker:v1.3.1    "/usr/bin/supervisor   27 minutes ago      Up 27 minutes       0.0.0.0:80->80/tcp, 0.0.0.0:2024->22/tcp   fe_container
```
####其中`container`的`22`端口被随机对应了`boot2docker`的`32769`端口
```
ssh root@127.0.0.1 -p 2024

```
就可以进入我们新的`container`里面，进行进一步操作了。

#### 常见问题整理












