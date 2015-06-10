# feDocker
简单配置一个前端开发环境所需要的docker



### 配置内容

- supervisor(用于启动多项应用)

- nginx(默认指向/home/data)

- ssh

- vim (安装了基本的bundle包管理器和一个color-scheme包)

### 建立镜像 
```
docker build -t fe_docker:vtest6 .

```


### 运行一个容器

```
docker run -d -t -i -p 22 -p 80:80  -v /Users/fanyongdong/work:/home/data  --name volumesss  fe_docker:vtest7
```

