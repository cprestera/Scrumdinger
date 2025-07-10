//
//  DetailsEditView.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 7/9/25.
//

import SwiftUI

struct DetailsEditView: View {
    @State private var scrum = DailyScrum.emptyScrum

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(
                        value: $scrum.lengthInMinutesAsDouble, in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
        }
    }
}

#Preview {
    DetailsEditView()
}
