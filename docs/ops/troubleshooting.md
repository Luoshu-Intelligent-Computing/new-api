# 故障排查

## 1. 渠道测试报错，但真实请求可用

### 现象

- 后台“测试渠道”报 `404 page not found`
- 或提示不支持 `/v1/chat/completions`
- 但真实 `POST /v1/responses` 可以正常返回

### 原因

- 某些上游只实现了 `Responses API`
- `new-api` 的后台测试对 `OpenAI` 型渠道可能仍优先使用 `chat/completions`
- 这是测试探针与真实业务协议不一致，不一定代表渠道不可用

### 建议

- 对 `Codex` 上游，以真实 `POST /v1/responses` 验收为准

## 2. Codex 请求延迟高于上游面板

### 当前结论

不是简单的“请求体几十 KB 上传慢”。更可能是以下因素叠加：

- `Codex CLI` 风格请求
- `stream=true`
- `reasoning_effort=high`
- `prompt_cache_key`
- `Session_id` 复用
- 上游自身的会话态 / trace / 缓存处理路径

### 已观察到的事实

- 普通 `Responses` 请求延迟正常
- 带 `Codex CLI` 风格头的请求延迟明显变高
- 复用同一会话标识时，延迟可能进一步放大

### 建议

- 尽量不要长期复用同一 `Session_id`
- 控制上下文长度
- 降低 `reasoning_effort`
- 保持高优先级渠道使用兼容性更好的上游

## 3. 域名配置未生效

### 检查顺序

- 权威 NS 是否已经切到当前 DNS 服务商
- `api.ails.ltd` 是否解析到 `45.207.213.87`
- 若要正式上 HTTPS，需要先处理 `80/443` 被 `derper` 占用的问题
