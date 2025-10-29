//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 3/24/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
