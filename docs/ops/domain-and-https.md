# 域名与 HTTPS 规划

## 当前状态

- 业务域名：`api.ails.ltd`
- 当前临时访问入口：`http://45.207.213.87:8081`
- 目标访问入口：`https://api.ails.ltd`

## 主要阻碍

- `80/443` 当前被 `derper` 占用
- 申请标准 HTTP/HTTPS 证书前，需要先明确：
  - 是否迁移 `derper` 端口
  - 或是否将 `new-api` 切到其他具备标准 80/443 的机器

## 推荐路线

1. 先确认域名 NS 与 A 记录完全生效
2. 处理 `80/443` 端口归属
3. 为 `api.ails.ltd` 配置 Nginx `server_name`
4. 申请并部署 TLS 证书
5. 将 `ServerAddress` 更新为 `https://api.ails.ltd`
