//
//  friend.swift
//  birth
//
//  Created by Ámbar Aguilar Sánchez on 25/07/25.
//

import Foundation
import SwiftData
@Model
class Friend {
    var name: String
    var birthday: Date
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
