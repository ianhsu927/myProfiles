# My Mac

## 说明

> 这是一个记录我在 Mac 上的一些配置和使用的文档。
> 由 Github Copilot / ChatGPT 辅助编写

Mac 设备

- MacBook Pro 14 2021
  - M1 Pro 8c CPU, 14c GPU
  - 16GB
  - 512GB
- Mac mini 2023
  - M2 8c CPU, 10c GPU
  - 16GB
  - 256GB

## 目录

## Terminal

### Homebrew

Homebrew 是必装软件，它是 Mac 上的包管理工具，类似于 Linux 上的 apt-get、yum 等。

安装地址: [Homebrew / Linuxbrew 镜像使用帮助]('https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/')

```bash
# 安装 iterm
brew install --cask iterm2
```

### zsh

macOS 内置 [zsh]()

#### zsh 拓展

```bash
brew install zsh-syntax-highlighting    # 语法高亮
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # oh-my-zsh

# Copilot
gh extension install github/gh-copilot
```

zsh 的配置文件是 `~/.zshrc`, 为了便于管理和备份，我将配置文件放在了 `～/my-mac/main.sh` 中，然后在 `~/.zshrc` 中引入。

`main.sh` 再引入其他配置文件, 包括

- `brew.sh`
- `node.sh`
- `python.sh`

```bash
#! ~/.zshrc
source ~/my-mac/main.sh
```

`pyenv` 和 `nvm` 是 `python` 和 `node` 的版本管理工具, 文件目录中的 `.nvmrc`和 `.python-version`文件可以指定项目的 `node`和 `python`版本。其中 `.nvmrc` 文件需要在 `shell` 命令中手动执行

```bash
if [ -f .nvmrc ]; then
  nvm use
fi
```

## Raycast

[Raycast]() 是一个快速启动工具，类似于 Alfred，但是 Raycast 是免费的。

Raycast 本体免费但是订阅服务收费, 好在大部分关键功能都是免费的。AI 助手功能是收费的，但是我用的是 Github Copilot，所以不需要 Raycast 的 AI 助手。但也有些好用的功能例如剪切板历史, 翻译, 好在我都有替代方案。
剪切板历史使用 [PasteNow](), 这是收费的, 快捷键设置为 `cmd + shift + v`, 很好用。
翻译暂时没有搞清楚

- [ ] 翻译功能完善
- [ ] 研究[开发文档]()

### 科学上网

#### clashx pro

clash 的配置文件默认放在 `~/.config/clash` 目录下, 支持 iCloud

- [ ] 将配置文件放在了 `~/my-mac/clash` 目录下, 然后在 `~/.config/clash` 目录下创建软连接

**常用快捷键**

- 最常使用的是连接查看器, 我设置了快捷键 `cmd + shift + l` 打开连接查看器
- `cmd + control + p` 开启系统代理

- [ ] 研究规则配置
