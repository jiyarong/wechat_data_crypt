# wechat_data_crypt
微信小程序对称解密的Ruby实现

用法

```ruby
d = DecodeWechatEncrypted.new "你的AppKey", "你的SessionKey"
encryptedData = "你的加密数据"

json = d.decryptData encryptedData, "你拿到的iv"
```
