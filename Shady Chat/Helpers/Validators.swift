//
//  Validators.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 29.07.2022.
//

import Foundation

class Validators {
    
    static func isFill(email: String?, password: String?, confirmPassword: String?) -> Bool {
        
        guard let password = password,
              let confirmPassword = confirmPassword,
              let email = email,
              password != "",
              email != "",
              confirmPassword != "" else {
                return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
            
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    static func check(text: String, regEx: String) -> Bool {

        let pradicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pradicate.evaluate(with: text)
    }
}
