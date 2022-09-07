//
//  AuthError.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 29.07.2022.
//

import Foundation

enum AuthError {
        
    case notFilled
    case invalidEmail
    case passwordNotMached
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    
    var errorDescription: String? {
        
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Mail format is not valid", comment: "")
        case .passwordNotMached:
            return NSLocalizedString("Password do nott match", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
    
}
