# 🖥️ Server Performance Analyzer

A simple Bash script to analyze basic server performance stats like CPU, memory, and disk usage. You can run it directly on any Linux machine or inside a Docker container.

## 📋 Features

- ✅ Total CPU usage
- ✅ Total memory usage (free vs used)
- ✅ Total disk usage
- ✅ Top 5 processes by CPU and memory
- ✅ OS version, uptime, load average, logged-in users
- ✅ Failed SSH login attempts (last 24 hours)

## 🐧 Run on Linux

```bash
chmod +x server-stats.sh
./server-stats.sh
```

## 🐳 Run with Docker

### Step 1: Build the Docker image

```bash
docker build -t server-analyzer.
```
### Step 2: Run the container
```bash
docker run --rm server-analyzer
```
## 🔗 Project Page
[GitHub Repository](https://github.com/YOUR_USERNAME/server-performance-analyzer)


## 📜 License
This project is licensed under the MIT License.


