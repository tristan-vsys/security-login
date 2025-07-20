# Security Login

一个简单的登录界面，通过 .env 文件配置用户名、密码和重定向URL。

## 功能特点

- 简洁美观的登录界面
- 通过 .env 文件配置登录凭据
- 登录成功后重定向到指定网站
- 响应式设计，支持移动端
- 记住密码功能
- Docker 支持
- CapRover 部署就绪

## 快速开始

1. 安装依赖：
   ```bash
   npm install
   ```

2. 配置 .env 文件（已创建示例配置）：
   - `USERNAME`: 登录用户名
   - `PASSWORD`: 登录密码  
   - `REDIRECT_URL`: 登录成功后跳转的网站
   - `PORT`: 服务器端口（可选，默认3000）

3. 启动服务器：
   ```bash
   npm start
   ```

4. 打开浏览器访问 `http://localhost:3000`

## 当前配置

- 用户名: `admin`
- 密码: `123456`
- 重定向URL: `https://www.github.com`
- 端口: `3000`

你可以修改 `.env` 文件来更改这些配置。

## CapRover 部署

这个应用已经配置好可以直接部署到 CapRover。

### 部署步骤

1. **准备部署包**：
   ```bash
   # Windows 用户
   deploy.bat
   
   # Linux/Mac 用户
   chmod +x deploy.sh
   ./deploy.sh
   ```

2. **在 CapRover 中创建应用**：
   - 登录 CapRover 控制台
   - 创建新应用（如：`security-login`）
   - 上传生成的 `deploy.tar.gz` 文件

3. **配置环境变量**：
   在 CapRover 应用设置中添加以下环境变量：
   ```
   LOGIN_USERNAME=your_username
   PASSWORD=your_secure_password
   REDIRECT_URL=https://your-target-site.com
   NODE_ENV=production
   ```

4. **启用 HTTPS**：
   - 在应用设置中启用 "Enable HTTPS"
   - 配置域名（可选）

5. **部署应用**：
   - 点击"Deploy"按钮
   - 等待部署完成

### Docker 本地测试

```bash
# 构建镜像
docker build -t security-login .

# 运行容器
docker run -p 3000:3000 \
  -e LOGIN_USERNAME=admin \
  -e PASSWORD=your_password \
  -e REDIRECT_URL=https://github.com \
  security-login
```

### 生产环境注意事项

- 确保使用强密码
- 启用 HTTPS
- 定期更新依赖包
- 监控应用健康状态
