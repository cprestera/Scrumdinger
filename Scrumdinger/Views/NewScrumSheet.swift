//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 10/29/25.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailsEditView(scrum: $newScrum, saveEdits: { dailyScrum in scrums.append(newScrum) })
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
}
