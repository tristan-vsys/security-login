# CapRover 部署配置说明

## 应用设置

### 基本信息
- **应用名称**: security-login (或你喜欢的名称)
- **端口**: 3000 (Docker内部端口，CapRover会自动处理)

### 必需的环境变量

在CapRover应用设置 -> App Configs -> Environment Variables 中添加：

```
LOGIN_USERNAME=你的用户名
PASSWORD=你的安全密码
REDIRECT_URL=https://目标网站.com
NODE_ENV=production
```

### 可选的环境变量

```
PORT=3000
TZ=Asia/Shanghai
```

## 部署步骤

1. **上传代码**:
   - 将整个项目文件夹打包为 tar.gz 格式
   - 在CapRover控制台选择 "Tarball" 部署方式
   - 上传打包文件

2. **配置环境变量**:
   - 按照上面的列表设置环境变量
   - 确保密码足够安全

3. **启用HTTPS**:
   - 在 App Configs -> HTTP Settings 中
   - 勾选 "Enable HTTPS"
   - 勾选 "Redirect HTTP to HTTPS"

4. **设置域名** (可选):
   - 在 App Configs -> HTTP Settings 中
   - 添加你的自定义域名

5. **部署应用**:
   - 点击 "Deploy" 按钮
   - 等待构建和部署完成

## 健康检查

应用包含自动健康检查功能，CapRover会：
- 每30秒检查一次应用状态
- 如果连续3次失败会重启容器
- 启动后等待15秒再开始检查

## 安全建议

- 使用强密码 (至少12位，包含大小写字母、数字、特殊字符)
- 启用HTTPS
- 定期更换密码
- 监控访问日志

## 故障排除

如果部署失败，检查：
1. 环境变量是否正确设置
2. CapRover日志中的错误信息
3. 健康检查是否通过

## 更新应用

要更新应用：
1. 修改代码
2. 重新打包
3. 在CapRover中重新部署
4. 环境变量会自动保留
