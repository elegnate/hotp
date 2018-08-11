# hotp
<br>
You need to 'CryptoSwift'.<br>
<code>pod 'CryptoSwift'</code>
<br>
<h2>Example</h2>
<br>
<h3>Generate OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)</code><br>
<code>let code = otp.Generate()</code><br>
<br>
<h3>Verify OTP code</h3>
<code>let otp  = OTP(msg: "plain message", password: "secret information", digits: 6, period, 180)</code><br>
<code>let testCode = 123123</code><br>
<br>
<code>if otp.Verify(testCode) {</code><br>
&nbsp;&nbsp;&nbsp;&nbsp;// success<br>
<code>} else {</code><br>
&nbsp;&nbsp;&nbsp;&nbsp;// fail<br>
<code>}</code><br>
