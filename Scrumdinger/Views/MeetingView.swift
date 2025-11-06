//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 3/24/25.
//

import SwiftUI
import SwiftData

struct MeetingView: View {
    @Environment(\.modelContext) private var context
    let scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    @Binding var errorWrapper: ErrorWrapper?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            startScrum()
        }
        .onDisappear {
            do {
                try endScrum()
            } catch {
                errorWrapper = ErrorWrapper(error: error, guidance: "Meeting time was not recorded. Try again later.")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
        scrumTimer.startScrum()
    }
    
    private func endScrum() throws {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
        try context.save()
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: scrum, errorWrapper: .constant(nil))
}
