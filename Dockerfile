# 使用 Alpine Linux 作为基础镜像
FROM --platform=linux/amd64 alpine:latest

# 替换软件仓库地址为国内清华地址
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# 安装 Nginx
RUN apk add --no-cache nginx

# 复制自定义的 Nginx 配置文件
#COPY nginx.conf /etc/nginx/nginx.conf

# 安装 ngx_http_image_filter_module 模块
RUN apk add --no-cache nginx-mod-http-image-filter

# 暴露的端口号设为 80
EXPOSE 80

# 启动 Nginx 服务
CMD ["nginx", "-g", "daemon off;"]

