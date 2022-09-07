//
//  SelfConfiguringCell.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 26.07.2022.
//

import Foundation

protocol SelfConfiguringCell {
    
    static var reuseId: String { get }
    func configure(with value: MChat)
}
