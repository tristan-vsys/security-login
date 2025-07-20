# CapRover 部署检查清单

## 部署前检查 ✅

- [ ] `captain-definition` 文件存在且格式正确
- [ ] `Dockerfile` 配置正确
- [ ] `.dockerignore` 排除了不必要的文件
- [ ] `healthcheck.js` 健康检查文件存在
- [ ] `package.json` 包含所有必需的依赖

## CapRover 配置 ✅

- [ ] 创建了新的CapRover应用
- [ ] 设置了以下环境变量：
  - [ ] `LOGIN_USERNAME`
  - [ ] `PASSWORD` 
  - [ ] `REDIRECT_URL`
  - [ ] `NODE_ENV=production`
- [ ] 启用了HTTPS
- [ ] 配置了自定义域名（可选）

## 部署步骤 ✅

- [ ] 运行 `deploy.bat` 创建部署包
- [ ] 上传 tar.gz 文件到CapRover
- [ ] 等待构建完成
- [ ] 检查应用状态为"Running"
- [ ] 测试登录功能
- [ ] 验证HTTPS重定向

## 测试检查 ✅

- [ ] 应用能正常访问
- [ ] 登录页面显示正常
- [ ] 正确的用户名密码能登录成功
- [ ] 错误的用户名密码显示错误信息
- [ ] 记住密码功能正常工作
- [ ] 登录成功后正确重定向
- [ ] HTTPS强制重定向工作正常

## 故障排除 🔧

如果遇到问题：

1. **构建失败**：
   - 检查CapRover日志
   - 确认Dockerfile语法正确
   - 检查依赖是否安装成功

2. **健康检查失败**：
   - 检查应用是否在端口3000上监听
   - 查看健康检查日志
   - 确认应用启动正常

3. **环境变量问题**：
   - 检查变量名是否正确
   - 确认值中没有特殊字符问题
   - 重新部署应用

4. **登录问题**：
   - 确认LOGIN_USERNAME和PASSWORD设置正确
   - 检查REDIRECT_URL格式
   - 查看应用日志

## 安全提醒 🔒

- ✅ 使用强密码
- ✅ 启用HTTPS
- ✅ 定期更新密码
- ✅ 监控访问日志
- ✅ 保持依赖更新
