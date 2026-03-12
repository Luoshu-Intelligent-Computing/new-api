# 部署说明

## 当前结构

- `new-api` 二进制：`/opt/new-api/bin/new-api`
- 环境变量文件：`/opt/new-api/.env`
- SQLite 数据库：`/opt/new-api/data/new-api.db`
- 日志文件：`/opt/new-api/log/new-api.log`
- systemd 单元：`/etc/systemd/system/new-api.service`
- Nginx 站点：`/etc/nginx/sites-available/new-api`

## 当前端口

- `3000`：`new-api` 应用监听
- `8081`：Nginx 对外临时入口
- `80/443`：当前被 `derper` 占用，域名 HTTPS 改造前需先处理该占用

## 当前服务状态建议检查项

```bash
ssh hk 'systemctl status new-api --no-pager'
ssh hk 'tail -n 100 /opt/new-api/log/new-api.log'
ssh hk 'ss -lntp | egrep ":(3000|8081|80|443)\\s"'
```

## 应用重启

```bash
ssh hk 'systemctl restart new-api'
ssh hk 'systemctl status new-api --no-pager'
```

## Nginx 重载

```bash
ssh hk 'nginx -t && systemctl reload nginx'
```

## 数据库备份

参考：`scripts/backup_newapi_db.sh`
