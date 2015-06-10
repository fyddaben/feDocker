# feDocker
简单配置一个前端开发环境所需要的docker


### 建立镜像 
```
docker build -t fe_docker:vtest6 .

```


### 运行一个容器

```
docker run -d -i -t -p 22 -p 80:80 fe_docker:vtest6    
```

