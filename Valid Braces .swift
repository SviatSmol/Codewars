import Foundation

func validBraces(_ string:String) -> Bool {
    
    var checkString = string
    
        for _ in 0..<Int(checkString.count / 2) {
            checkString = checkString.replacingOccurrences(of: "()", with: "")
                .replacingOccurrences(of: "[]", with: "")
                .replacingOccurrences(of: "{}", with: "")
        }
    return checkString.isEmpty
}
