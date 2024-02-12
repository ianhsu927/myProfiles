export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # 加载 nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # 加载 nvm bash 补全

# 如果当前目录存在 .nvmrc 文件，则使用 nvm 切换 node 版本
if [ -f .nvmrc ]; then
  nvm use
fi
