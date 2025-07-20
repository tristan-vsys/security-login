#!/bin/bash

# CapRover Deployment Script
# Make sure to replace YOUR_APP_NAME and YOUR_CAPROVER_URL with actual values

APP_NAME="security-login"
CAPROVER_URL="your-caprover-url.com"

echo "🚀 Starting CapRover deployment..."

# Create tar file excluding unnecessary files
echo "📦 Creating deployment package..."
tar -czf ./deploy.tar.gz \
    --exclude=node_modules \
    --exclude=.git \
    --exclude=.env \
    --exclude=*.log \
    --exclude=deploy.tar.gz \
    .

echo "📋 Deployment package created successfully!"
echo ""
echo "📝 Next steps:"
echo "1. Upload deploy.tar.gz to your CapRover dashboard"
echo "2. Set the following environment variables in CapRover:"
echo "   - LOGIN_USERNAME=your_username"
echo "   - PASSWORD=your_secure_password" 
echo "   - REDIRECT_URL=your_redirect_url"
echo "   - NODE_ENV=production"
echo "3. Enable HTTPS in CapRover app settings"
echo "4. Deploy the application"
echo ""
echo "🔗 Access your CapRover dashboard at: https://$CAPROVER_URL"

# Clean up
echo "🧹 Cleaning up..."
# rm -f deploy.tar.gz

echo "✅ Deployment preparation complete!"
