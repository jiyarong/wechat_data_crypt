require "base64"
require "openssl"
require "json"

class DecodeWechatEncrypted
  attr_accessor :appId, :sessionKey
  def initialize appId, sessionKey
    self.appId = appId
    self.sessionKey = sessionKey
  end

  def decryptData encryptedData, iv
    sessionKey = Base64.decode64(self.sessionKey)
    encryptedData = Base64.decode64(encryptedData)
    iv = Base64.decode64(iv)
    cipher = OpenSSL::Cipher.new("AES-128-CBC")
    cipher.decrypt
    cipher.key = sessionKey
    cipher.iv = iv

    result = cipher.update(encryptedData) + cipher.final
    JSON.parse result
  end
end
