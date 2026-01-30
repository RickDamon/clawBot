# clawBot

快速启动一个 ClawdBot 服务的 Docker 镜像。

## 环境变量配置

### 必需的环境变量

| 变量名 | 说明 | 示例 |
|--------|------|------|
| `ACCESS_TOKEN` | 访问认证令牌 | `your-access-token` |

### AI 模型配置（至少配置一个）

#### OpenAI 配置
| 变量名 | 说明 | 示例 |
|--------|------|------|
| `OPENAI_API_KEY` | OpenAI API 密钥 | `sk-...` |
| `OPENAI_BASE_URL` | OpenAI API 基础URL（可选） | `https://api.openai.com/v1` |

#### Anthropic 配置
| 变量名 | 说明 | 示例 |
|--------|------|------|
| `ANTHROPIC_API_KEY` | Anthropic API 密钥 | `sk-ant-...` |
| `ANTHROPIC_BASE_URL` | Anthropic API 基础URL（可选） | `https://api.anthropic.com` |

#### DeepSeek 配置
| 变量名 | 说明 | 示例 |
|--------|------|------|
| `DEEPSEEK_API_KEY` | DeepSeek API 密钥 | `sk-...` |
| `DEEPSEEK_BASE_URL` | DeepSeek API 基础URL（可选） | `https://api.deepseek.com/v1` |

### 可选配置
| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `DEFAULT_MODEL` | 默认使用的模型 | `openai/gpt-4o` |

## 快速启动

### 1. 构建镜像

```bash
docker build -t clawbot .
```

### 2. 运行容器（使用 OpenAI）

```bash
docker run -d \
  -p 8686:8686 \
  -e ACCESS_TOKEN="your-access-token" \
  -e OPENAI_API_KEY="sk-your-openai-key" \
  --name clawbot \
  clawbot
```

### 3. 运行容器（使用 DeepSeek）

```bash
docker run -d \
  -p 8686:8686 \
  -e ACCESS_TOKEN="your-access-token" \
  -e DEEPSEEK_API_KEY="sk-your-deepseek-key" \
  -e DEFAULT_MODEL="deepseek/deepseek-chat" \
  --name clawbot \
  clawbot
```

### 4. 运行容器（使用 Anthropic Claude）

```bash
docker run -d \
  -p 8686:8686 \
  -e ACCESS_TOKEN="your-access-token" \
  -e ANTHROPIC_API_KEY="sk-ant-your-anthropic-key" \
  -e DEFAULT_MODEL="anthropic/claude-3-5-sonnet-20241022" \
  --name clawbot \
  clawbot
```

### 5. 运行容器（同时配置多个模型）

```bash
docker run -d \
  -p 8686:8686 \
  -e ACCESS_TOKEN="your-access-token" \
  -e OPENAI_API_KEY="sk-your-openai-key" \
  -e ANTHROPIC_API_KEY="sk-ant-your-anthropic-key" \
  -e DEEPSEEK_API_KEY="sk-your-deepseek-key" \
  --name clawbot \
  clawbot
```

### 6. 访问服务

浏览器打开：`http://localhost:8686`

首次访问会自动跳转到带 token 的认证地址。

## 支持的模型

### OpenAI 模型
- `openai/gpt-4o` - GPT-4o
- `openai/gpt-4o-mini` - GPT-4o Mini

### Anthropic 模型
- `anthropic/claude-3-5-sonnet-20241022` - Claude 3.5 Sonnet

### DeepSeek 模型
- `deepseek/deepseek-chat` - DeepSeek Chat（通用对话模型）
- `deepseek/deepseek-coder` - DeepSeek Coder（代码专用模型）
- `deepseek/deepseek-reasoner` - DeepSeek Reasoner（推理模型，支持CoT）

## 配置说明

配置文件 `clawbot.json` 主要包含：

- **models**: 模型提供者配置（OpenAI、Anthropic）
- **agents**: Agent 默认配置（工作目录、并发数等）
- **tools**: 工具开关配置
- **gateway**: 网关配置（端口、认证模式等）

## 目录结构

```
.
├── Dockerfile      # Docker 镜像构建文件
├── clawbot.json    # ClawdBot 配置文件
├── start.sh        # 启动脚本
└── README.md
```

