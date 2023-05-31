//
//  swift_furniture_shopApp.swift
//  swift-furniture-shop
//
//  Created by Hakan Karaahmetoğlu  on 31.05.2023.
//

import SwiftUI

@main
struct swift_furniture_shopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
