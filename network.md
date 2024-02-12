# Mac 网络设置

## 命令

shell 命令设置代理

> `Copilot` 编写

```bash
networksetup -listallnetworkservices    # 列出所有网络服务
alias unproxy="unset https_proxy http_proxy all_proxy"
# 如果 mac 设置中的代理打开，那么就使用代理
if networksetup -getwebproxy Wi-Fi | grep "Enabled: Yes" >/dev/null; then
  echo "mac 代理已经打开, unproxy 解除代理"
  # 获得代理地址
  url=$(networksetup -getwebproxy Wi-Fi | grep "Server: " | awk '{print $2}')
  port=$(networksetup -getwebproxy Wi-Fi | grep "Port: " | awk '{print $2}')
  export https_proxy=http://$url:$port http_proxy=http://$url:$port all_proxy=socks5://$url:$port
  echo "代理地址: $url:$port"
fi
```

## 外置网卡

MacBook Pro 14 2021 内置的无线网卡不支持 160MHz 频段, 内网速度不太行而且 Mac 的无线网络稳定性也不如 Intel 和高通的无线网卡,因此外置有线网卡很有必要,但是在之前使用 Mac mini 时,我发现在使用 8156B 网卡并进行大量数据传输时会导致系统卡死,在最近用 MacBook 时没有这个问题,我也没有再去使用 Mac mini 做测试,所以不知道是不是系统问题
RTL-8156B 瑞昱 2.5G USB 网卡,这应该是市面上唯一可以买到可以价格实惠的超千兆网卡(截止 2024.2)
