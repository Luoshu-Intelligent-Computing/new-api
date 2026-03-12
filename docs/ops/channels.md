# 渠道说明

## Claude 渠道

### Claude-CodeFlow

- 类型：Anthropic
- 状态：启用
- 分组：`default,claude`
- 可用模型：
  - `claude-haiku-4-5-20251001`
  - `claude-sonnet-4-6`
  - `claude-opus-4-6`
- 说明：支持最新 `Opus / Sonnet / Haiku`，旧模型名不建议直接暴露给客户端

### Claude-Heiyucode

- 类型：Anthropic
- 状态：启用
- 分组：`default,claude`
- 可用模型：
  - `claude-haiku-4-5-20251001`
  - `claude-sonnet-4-6`
- 说明：`Opus` 型号能力受限，不应作为 `Opus` 主路由

## Codex 渠道

### Codex-Kangaroom

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`2`
- 可用模型：
  - `gpt-5.4`
  - `gpt-5.3-codex`
- 说明：当前主通道，兼容字符串 `input` 与数组 `input`

### Codex-Xcode

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`0`
- 说明：当前稳定备用

### Codex-CodeFlow

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`-1`
- 说明：可用，但更适合作为备用；对 `input` 形态更严格，建议作为 `Codex CLI` 备用而非通用首选

### Codex-Heiyucode

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`-2`
- 说明：直连可能可用，但在网关里做平权负载时存在响应体不稳定问题，不应提升优先级

### Codex-Gmncode

- 类型：OpenAI / Responses
- 状态：禁用
- 优先级：`-3`
- 说明：已知在维护期，不纳入自动分发
