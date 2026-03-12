# API Gateway Ops

用于维护自用 `Claude / Codex` API 中转网关的运维资料库。

## 目标

- 固化当前可用部署方案，便于重装、迁移与复用
- 记录渠道能力、优先级、已知兼容问题
- 提供最小可用的运维脚本与配置模板
- 避免真实密钥散落在聊天记录和临时命令里

## 当前部署概览

- 服务：`new-api`
- 服务器：`hk`（公网 IP：`45.207.213.87`）
- 当前公网入口：`http://45.207.213.87:8081`
- 预留域名：`api.ails.ltd`
- 应用监听：`3000`
- Nginx 反向代理监听：`8081`
- 数据库：SQLite，路径 `/opt/new-api/data/new-api.db`
- 日志：`/opt/new-api/log/new-api.log`

## 当前可用模型

### Claude

- `claude-haiku-4-5-20251001`
- `claude-sonnet-4-6`
- `claude-opus-4-6`

### Codex

- `gpt-5.4`
- `gpt-5.3-codex`

## 文档索引

- `docs/deployment.md`：部署结构、端口、服务、日志、数据库
- `docs/channels.md`：上游渠道能力、优先级、已知问题
- `docs/troubleshooting.md`：常见故障与定位方法
- `docs/domain-and-https.md`：域名与 HTTPS 规划说明

## 目录说明

- `server/`：服务与反向代理配置模板
- `scripts/`：健康检查、数据库备份等脚本
- `backups/`：建议放非敏感配置备份与人工导出结果

## 安全约定

- 不在仓库中保存真实 API Key、Token、密码
- 仅保留 `.example` 模板与字段说明
- 若需保存敏感信息，请使用密码管理器或单独加密文件
