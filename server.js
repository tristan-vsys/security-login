require('dotenv').config();
const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Trust proxy for CapRover deployment
app.set('trust proxy', true);

// Security and logging middleware
app.use((req, res, next) => {
    // Log requests in production
    if (process.env.NODE_ENV === 'production') {
        console.log(`${new Date().toISOString()} - ${req.method} ${req.url} - ${req.ip}`);
    }
    next();
});

// Security middleware for production
if (process.env.NODE_ENV === 'production') {
    // Force HTTPS in production (CapRover handles SSL termination)
    app.use((req, res, next) => {
        if (req.header('x-forwarded-proto') && req.header('x-forwarded-proto') !== 'https') {
            return res.redirect(`https://${req.header('host')}${req.url}`);
        }
        next();
    });
}

// Middleware
app.use(express.json({ limit: '10mb' }));
app.use(express.static(path.join(__dirname)));

// Serve login page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Handle login request
app.post('/login', (req, res) => {
    const { username, password } = req.body;
      // Get correct username and password from environment variables
    const correctUsername = process.env.LOGIN_USERNAME;
    const correctPassword = process.env.PASSWORD;
    const redirectUrl = process.env.REDIRECT_URL;
    
    // Validate username and password
    if (username === correctUsername && password === correctPassword) {
        res.json({ 
            success: true, 
            redirectUrl: redirectUrl 
        });    } else {
        res.status(401).json({ 
            success: false, 
            error: 'Invalid username or password' 
        });
    }
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
    console.log(`Username: ${process.env.LOGIN_USERNAME}`);
    console.log(`Redirect URL: ${process.env.REDIRECT_URL}`);
});
