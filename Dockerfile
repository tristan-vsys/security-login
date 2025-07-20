FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy application files
COPY . .

# Create non-root user for security
RUN addgroup -g 1001 -S appuser && \
    adduser -S appuser -u 1001 -G appuser

# Change ownership of the app directory
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose port (CapRover will handle port mapping)
EXPOSE 3000

# Health check for CapRover
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD node healthcheck.js

# Start the application
CMD ["node", "server.js"]
