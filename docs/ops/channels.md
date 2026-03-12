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
- 说明：模型列表配置为最新 `Opus / Sonnet / Haiku`，但最近一次从 `hk` 直连实测返回过 `503 system memory overloaded`，不建议作为当前主路由

### Claude-Heiyucode

- 类型：Anthropic
- 状态：启用
- 分组：`default,claude`
- 可用模型：
  - `claude-haiku-4-5-20251001`
  - `claude-sonnet-4-6`
- 说明：当前 `Claude` 侧更稳定的可用通道，`Opus` 型号能力受限，不应作为 `Opus` 主路由

## Codex 渠道

### Codex-Kangaroom

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`0`
- 可用模型：
  - `gpt-5.4`
  - `gpt-5.3-codex`
  - `gpt-5.1-codex-mini`
- 说明：当前主通道；兼容字符串 `input` 与数组 `input`，但近期实测存在明显时延波动，并多次出现 `Cloudflare 524`，需要持续观察

### Codex-CodeFlow

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`-1`
- 可用模型：
  - `gpt-5.4`
  - `gpt-5.3-codex`
  - `gpt-5.1-codex-mini`
- 说明：上游本身可用，但要求 `input` 必须是 list；当前通过网关默认转发时会报 `Input must be a list`，在完成专门兼容前不适合作为默认主路由

### Codex-Heiyucode

- 类型：OpenAI / Responses
- 状态：启用
- 优先级：`-1`
- 可用模型：
  - `gpt-5.4`
  - `gpt-5.3-codex`
  - `gpt-5.1-codex-mini`
- 说明：对 `Codex CLI` 风格流式请求实测可用，但对普通非流式 `Responses` 请求会返回 SSE/event-stream，导致网关按 JSON 解析时报错；在完成专门兼容前仅适合低优先级备用

### Codex-Gmncode

- 类型：OpenAI / Responses
- 状态：禁用
- 优先级：`-2`
- 可用模型：
  - `gpt-5.4`
  - `gpt-5.3-codex`
  - `gpt-5.1-codex-mini`
- 当前地址：`https://cdn.gmncode.cn`
- 说明：已切换到从 `hk` 看起来更优的备用地址，但最近一次直连三种模型仍全部返回 `502`，当前视为未恢复，不纳入自动分发

## 备注

- 本文档描述的是 2026-03-12 的线上实测状态，不代表上游渠道长期稳定性
- `Codex` 渠道的后台“测试按钮”对仅支持 `Responses API` 的上游不一定准确，判断是否可用应优先以真实 `POST /v1/responses` 验收为准
