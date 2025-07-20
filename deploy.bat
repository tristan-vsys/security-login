@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo     CapRover 部署包创建工具
echo ==========================================
echo.

set APP_NAME=security-login
set TIMESTAMP=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set TIMESTAMP=!TIMESTAMP: =0!
set PACKAGE_NAME=!APP_NAME!-!TIMESTAMP!.tar.gz

echo 📦 正在创建部署包: !PACKAGE_NAME!
echo.

REM 检查是否安装了tar命令 (Windows 10 1803+)
tar --version >nul 2>&1
if !errorlevel! equ 0 (
    echo ✅ 使用系统自带的tar命令
    tar -czf !PACKAGE_NAME! ^
        --exclude=node_modules ^
        --exclude=.git ^
        --exclude=.env ^
        --exclude=*.log ^
        --exclude=deploy.tar.gz ^
        --exclude=!PACKAGE_NAME! ^
        .
    
    if !errorlevel! equ 0 (
        echo ✅ 部署包创建成功: !PACKAGE_NAME!
        echo.
        echo 📋 下一步操作:
        echo 1. 登录你的CapRover控制台
        echo 2. 创建新应用或选择现有应用
        echo 3. 选择 "Tarball" 部署方式
        echo 4. 上传文件: !PACKAGE_NAME!
        echo 5. 配置环境变量 (参考 CAPROVER-DEPLOY.md)
        echo 6. 启用HTTPS
        echo 7. 点击部署
        echo.
        echo 📖 详细说明请查看: CAPROVER-DEPLOY.md
    ) else (
        echo ❌ 创建部署包失败
        exit /b 1
    )
) else (
    echo ❌ 未找到tar命令
    echo 💡 解决方案:
    echo    1. 升级到Windows 10 1803或更高版本
    echo    2. 或安装Git for Windows (包含tar命令)
    echo    3. 或手动创建tar.gz文件包含以下内容:
    echo       - package.json
    echo       - server.js
    echo       - index.html
    echo       - healthcheck.js
    echo       - Dockerfile
    echo       - captain-definition
    echo       - .dockerignore
    exit /b 1
)

echo.
echo ✨ 完成! 
pause
