//
//  ActivityApp.swift
//  Activity
//
//  Created by TimurSmoev on 12/24/23.
//

import SwiftUI
import SwiftData

@main
struct ActivityApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([
            Project.self,
            Settings.self,
            StopwatchData.self
        ])
        let config = ModelConfiguration(isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: schema, configurations: config)
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
