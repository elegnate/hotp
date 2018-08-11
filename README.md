# hotp
<br>
You need to 'CryptoSwift'.<br>
<code>pod 'CryptoSwift'</code>
<br>
<h2>Example</h2>
<br>
<h3>Generate OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)\n
let code = otp.Generate()</code><br>
<br>
<h3>Verify OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)</code><br>
<code>let testCode = 123123</code><br>
<br>
<code>if otp.Verify(testCode) {</code><br>
  // success<br>
<code>} else {</code><br>
  // fail<br>
<code>}</code><br>
