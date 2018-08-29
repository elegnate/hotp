# hotp
CryptoSwift가 필요합니다. PodFile에 CryptoSwift를 추가한 후 ```pod install``` 해주세요.
<br>
# Example
## Generate OTP code

```swift
let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)
let code = otp.Generate()
```

## Verify OTP code

```swift
let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)
  let testCode = 123123

  if otp.Verify(testCode) {
    // success
  } else {
    // fail
  }
```
