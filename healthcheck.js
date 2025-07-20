const http = require('http');

const options = {
  hostname: 'localhost',
  port: process.env.PORT || 3000,
  path: '/',
  method: 'GET',
  timeout: 5000,
  headers: {
    'User-Agent': 'CapRover-HealthCheck/1.0'
  }
};

const request = http.request(options, (res) => {
  let data = '';
  
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    if (res.statusCode === 200) {
      console.log(`✅ Health check passed - Status: ${res.statusCode}`);
      process.exit(0);
    } else {
      console.log(`❌ Health check failed - Status: ${res.statusCode}`);
      process.exit(1);
    }
  });
});

request.on('error', (err) => {
  console.log('❌ Health check error:', err.message);
  process.exit(1);
});

request.on('timeout', () => {
  console.log('❌ Health check timeout after 5 seconds');
  request.destroy();
  process.exit(1);
});

request.setTimeout(5000);
request.end();
