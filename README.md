# hotp
<br>
You need to 'CryptoSwift'.<br>
<h3>pod 'CryptoSwift'</h3>
<br>
<h2>Example</h2>
<br>
<h3>Gernerate OTP code</h3>
let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)<br>
let code = otp.Gernerate()<br>
<br>
<h3>Verify OTP code</h3>
let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)<br>
let testCode = 123123<br>
<br>
if otp.Verify(testCode) {<br>
  // success<br>
} else {<br>
  // fail<br>
}<br>
