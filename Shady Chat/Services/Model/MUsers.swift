//
//  MUsers.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 27.07.2022.
//

import UIKit

struct MUsers: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUsers, rhs: MUsers) -> Bool {
        return lhs.id == rhs.id
    }
    
    func constains(filtred: String?) -> Bool {
        
        guard let filtred = filtred else { return true }
        if filtred.isEmpty  { return true}
        let lowerCasedFiltred = filtred.lowercased()
        return username.lowercased().contains(lowerCasedFiltred)
    }
}
