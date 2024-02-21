# 如果你从 bash 转到 zsh 你可能需要修改 $PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# oh-my-zsh 的安装路径
export ZSH="$HOME/.oh-my-zsh"

# 设置加载的主题 --- 如果设置为 "random",
# 每次加载 oh-my-zsh 时都会加载一个随机主题,
# 在这种情况下, 要知道加载的是哪个特定的主题, 运行: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# 设置加载随机主题时要选择的主题列表
# 设置这个变量当 ZSH_THEME=random 时会导致 zsh 加载
# 一个主题从这个变量中加载而不是在 $ZSH/themes/ 中查找
# 如果设置为空数组, 这个变量将不会生效
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# 使用大小写敏感的补全
# CASE_SENSITIVE="true"

# 使用连字符不敏感的补全
# 连字符不敏感的补全必须关闭. _ 和 - 将是可以互换的
# HYPHEN_INSENSITIVE="true"

# 取消注释以下行之一以更改自动更新行为
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# 取消下一行的注释修改自动更新的频率(以日计数)
# zstyle ':omz:update' frequency 13

# 如果粘贴 URL 和其他文本出现问题, 取消下一行的注释
# DISABLE_MAGIC_FUNCTIONS="true"

# 取消下一行的注释以禁用 ls 中的颜色
# DISABLE_LS_COLORS="true"

# 取消下一行的注释以禁用自动设置终端标题
# DISABLE_AUTO_TITLE="true"

# 取消下一行的注释以启用命令自动纠正
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# 取消以下代码注释用于修改显示在历史命令输出中的命令执行时间戳.
# 你可以设置三种可选的格式:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# 或者使用 strftime 函数格式规范设置自定义格式, see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# 你是否想使用除了 $ZSH/custom 之外的其他自定义文件夹?
# ZSH_CUSTOM=/path/to/new-custom-folder

# 加载哪个插件?
# 标准插件可以在 $ZSH/plugins/ 中找到
# 自定义插件可以放在 $ZSH_CUSTOM/plugins/ 目录中
# 示例格式: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# zsh 设置
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # zsh 语法高亮
source ~/my-mac/brew.sh
source ~/my-mac/node.sh
source ~/my-mac/python.sh

# 用户设置

# export MANPATH="/usr/local/man:$MANPATH"

# 你可能需要手动设置你的语言环境
# export LANG=en_US.UTF-8

# 偏好的编辑器, 如果是 ssh 连接, 使用 vim, 否则使用 mvim, 注: mvim --> macvim, 默认不安装&&brew install macvim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# 编译标志
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# 设置个人的别名, 覆盖 oh-my-zsh 提供的别名,插件和主题.
# 别名可以放在这里, 尽管 oh-my-zsh 更鼓励用户在 $ZSH_CUSTOM/aliases/ 存放别名.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Clash 代理地址
alias proxy="export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893 all_proxy=socks5://127.0.0.1:7893"
alias unproxy="unset https_proxy http_proxy all_proxy"

alias macproxy="export https_proxy=http://192.168.1.123:7890 http_proxy=http://192.168.1.123:7890 all_proxy=socks5://192.168.1.123:7891"

alias openwrt="export all_proxy=http://192.168.1.100:1080"

export SSH_AUTH_SOCK=/Users/iansmac/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

alias clashproxy='sudo networksetup -setwebproxy "Wi-Fi" 127.0.0.1 7890 && sudo networksetup -setsecurewebproxy "Wi-Fi" 127.0.0.1 7890'

alias macmini="ssh ian@192.168.1.123"

alias ossutil="~/Downloads/ossutil-v1.7.18-mac-arm64/ossutilmac64"

alias ossup="ossutil cp $1 oss://yida-cdn/$1"

alias meta="export https_proxy=http://127.0.0.1:7894 http_proxy=http://127.0.0.1:7894 all_proxy=socks5://127.0.0.1:7894"

# 如果 mac 设置中的代理打开，那么就使用代理
if networksetup -getwebproxy Wi-Fi | grep "Enabled: Yes" >/dev/null; then
  echo "mac 代理已经打开, unproxy 解除代理"
  # 获得代理地址
  url=$(networksetup -getwebproxy Wi-Fi | grep "Server: " | awk '{print $2}')
  port=$(networksetup -getwebproxy Wi-Fi | grep "Port: " | awk '{print $2}')
  export https_proxy=http://$url:$port http_proxy=http://$url:$port all_proxy=socks5://$url:$port
  echo "代理地址: $url:$port"
fi
