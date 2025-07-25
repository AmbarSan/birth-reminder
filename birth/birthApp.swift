//
//  birthApp.swift
//  birth
//
//  Created by Ámbar Aguilar Sánchez on 25/07/25.
//

import SwiftUI
import SwiftData

@main
struct birthApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
