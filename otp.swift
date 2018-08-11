

import CryptoSwift
import Foundation


class OTP {
    
    private var algo: Int = Int(kCCHmacAlgSHA256)
    private var size: Int = Int(CC_SHA256_DIGEST_LENGTH)
    
    fileprivate var period: Int?
    fileprivate var secret: Data?
    fileprivate var digits: Int
    
    
    init(secret: Data, digits: Int = 8, period: Int = 60) {
        self.secret = secret
        self.period = period
        self.digits = digits
    }
    
    convenience init(msg: String, password: String, digits: Int = 8, period: Int = 60) {
        self.period = period
        
        do {
            let secret = try HMAC(key: (Data(base64Encoded: password)?.bytes)!, variant: .sha256).authenticate(msg.bytes)
            self.init(secret: Data(base64Encoded: Data(bytes: secret).base64EncodedString())!, digits: digits, period: period)
        } catch {
            self.secret = "".data(using: .utf8)
        }
    }
    
    
    func Generate(_ counter: Int64 = Date().timestamp) -> Int {
        var cnt = counter.bigEndian
        var buf = [UInt8](repeating: 0, count: self.size)
        CCHmac(UInt32(self.algo),
               (secret! as NSData).bytes, secret!.count, &cnt, MemoryLayout.size(ofValue: cnt),
               &buf)
        
        let off = Int(buf[19]) & 0x0f;
        let msk = UnsafePointer<UInt8>(buf).advanced(by: off).withMemoryRebound(to: UInt32.self,
                                                                                capacity: self.size / 4) {
            $0[0].bigEndian & 0x7fffffff
        }
        
        return Int(msk % pow(10, self.digits))
    }
    
    
    func Verify(otpCode: Int) -> Bool {
        let ts = Date().timestamp
        
        for i in stride(from: 0, to: self.period!, by: 1) {
            let verifyCode = self.Generate(ts - Int64(i))
            
            if otpCode == verifyCode {
                return true
            }
        }
        
        return false
    }
}
