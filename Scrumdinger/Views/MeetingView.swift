//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 3/24/25.
//

import SwiftUI
import SwiftData

struct MeetingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.filled")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaing")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.filled")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
        .modelContainer(for: Item.self, inMemory: true)
}
