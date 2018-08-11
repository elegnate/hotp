# hotp
<br>
You need to 'CryptoSwift'.<br>
<code>pod 'CryptoSwift'</code>
<br>
<h2>Example</h2>
<br>
<h3>Generate OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)<br>
let code = otp.Generate()</code><br>
<br>
<h3>Verify OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)<br>
let testCode = 123123<br>
<br>
if otp.Verify(testCode) {<br>
  // success<br>
} else {<br>
  // fail<br>
}</code><br>
