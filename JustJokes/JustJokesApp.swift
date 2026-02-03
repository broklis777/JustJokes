//
//  JustJokesApp.swift
//  JustJokes
//
//  Created by Justs Jekabsons on 01/02/2026.
//

import SwiftUI
import SwiftData

@main
struct JustJokesApp: App {
    @State private var repository = JokeRepository()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(repository)
        }
        .modelContainer(sharedModelContainer)
    }
}
