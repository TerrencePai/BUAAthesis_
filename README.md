# 使用方法
## 1. 在Windows下打开终端窗口
## 2. 下载项目到本地
有两种方法：
- 克隆到本地：
```
git clone git@github.com:TerrencePai/BUAAthesis_.git
```
- 直接下载压缩包到本地，同时需要注意的是：把“msmake.bat”文件的LF换行符改成CRLF换行符，VSCode或者Notepad都可以改。
## 3. 进入项目
```
cd BUAAthesis_
```
## 4. 编译
可以直接编译全文：
- 默认全文主tex文件名为paper，到BUAAthesis_目录下，执行命令:
```
msmake.bat
```
可以单独编译单个章节：
- 到BUAAthesis目录下，执行命令：“msmake.bat  subtex/章节名”，例如：
```
msmake.bat subtex/chapter2-config.tex
```

### 5. 注意事项
如果是直接下载的压缩包，需要注意的是，需要把可执行文件“msmake.bat”里面的换行由LF改为CRLF。
