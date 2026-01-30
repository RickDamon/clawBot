#!/bin/bash

set -e

# 加载环境变量
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# 创建配置目录
mkdir -p ~/.clawdbot

# 复制配置文件
cp clawbot.json ~/.clawdbot/clawdbot.json

echo "Starting ClawdBot with DeepSeek..."
echo "Access Token: $ACCESS_TOKEN"
echo "Default Model: $DEFAULT_MODEL"
echo "DeepSeek API Key: ${DEEPSEEK_API_KEY:0:10}..."

# 检查 clawdbot 是否已安装
if ! command -v clawdbot &> /dev/null; then
    echo "Installing clawdbot globally..."
    npm install -g clawdbot
fi

# 启动 clawdbot
echo "Starting ClawdBot gateway on port 18789..."
clawdbot gateway --allow-unconfigured