# google-fonts-proxy  
谷歌字体代理  
国内的网络访问不到谷歌的字体，可以在自己的VPS上部署本代理  


### 克隆项目
```
git clone https://github.com/cloverzrg/google-fonts-proxy.git
```

### 编辑 docker-compose.yaml
编辑traefik 路由，如果不使用traefik，可以省略这步，直接使用镜像 
```
traefik.http.routers.proxy.rule=Host(`fonts.xxx.com`)||Host(`fonts-static.xxx.com`)
```

### 编辑 nginx.conf
```

...
server_name fonts.xxx.com; // xxx.com替换为你的域名
...
valid_referers  none  blocked  server_names  *.xxx.com;  // allow refer, 替换 "*.xxx.com" 为你的域名，本操作只允许 *.xxx.com 访问你的代理
...

sub_filter 'fonts.gstatic.com' 'fonts-static.xxx.com'; // 替换 xxx.com 为你的域名
...
server_name fonts-static.xxx.com; // 替换 xxx.com 为你的域名

```

### 启动
```
docker-compose build && docker-compose up -d
```


### 使用
```
比如把谷歌字体连接https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap  
替换为https://fonts.xxx.com/css2?family=Lato:wght@300;400;700&display=swap (xxx.com为你的域名)
```
