//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 3/24/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
