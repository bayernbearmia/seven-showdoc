# ShowDoc 代码注释自动生成文档脚本 (Bash 版)

本脚本用于自动递归扫描指定目录下的源码文件，提取符合 ShowDoc 规范的块注释（`/** ... */`），并通过 ShowDoc 开放 API 接口自动将注释同步生成为在线 API 文档。

官方参考文档：[ShowDoc 注释生成文档规范](https://www.showdoc.com.cn/page/741656402509783)

## 🚀 功能特性

- **递归扫描**：自动递归搜索指定目录或当前目录下的所有子文件夹。
- **智能过滤**：仅扫描大小在 **1MB 以下** 且文件类型包含 **文本 (text)** 的文件，避免误扫描二进制文件，大幅提高执行效率。
- **精确匹配**：通过 `sed` 和正则表达式，精准抓取包含 `showdoc`、`@url` 和 `@title` 的标准块注释。
- **跨平台兼容**：支持在 Linux、macOS 以及 Windows (如 Git Bash、MINGW、Cygwin) 环境下原生运行。

## 🛠️ 前置要求

在运行脚本之前，请确保当前运行环境中已包含以下标准命令工具（大多数 Linux 发行版和 macOS 已默认自带，Windows 建议使用 Git Bash）：
- `bash`
- `curl` (用于发送网络请求)
- `sed`, `awk`, `grep` (用于文本匹配与处理)
- `file` (用于检测文件类型)

## ⚙️ 配置说明

在使用脚本前，请使用文本编辑器打开脚本文件，修改头部定义的 ShowDoc 项目 API 凭证：

```bash
# 请进入您的 ShowDoc 项目 -> 项目设置 -> 开放API 查看以下信息
api_key="你的_api_key"
api_token="你的_api_token"

# 如果您使用的是私有部署的 ShowDoc，请将下方的 URL 修改为您的私有服务器地址
url="[https://www.showdoc.com.cn/server/?s=/api/open/fromComments](https://www.showdoc.com.cn/server/?s=/api/open/fromComments)"
