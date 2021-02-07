# google-fonts-proxy  
谷歌字体代理  
国内的网络访问不到谷歌的字体，可以在自己的VPS上部署本代理  


### 启动
```
把 xxx.com 替换为你的域名
docker run --rm -e DOMAIN=xxx.com -p 80:80 cloverzrg/google-fonts-proxy
```

### 使用  
把谷歌字体链接`https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap` 中的 `googleapis.com` 替换为你的域名，如果没有https，还要把https改为http  
请保证 `fonts.xxx.com` 和 `fonts-static.xxx.com` 的域名解析正确

