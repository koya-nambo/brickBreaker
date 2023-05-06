//
//  brickBreakerApp.swift
//  brickBreaker
//
//  Created by 南房航哉 on 2023/05/07.
//

import SwiftUI

@main
struct brickBreakerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
