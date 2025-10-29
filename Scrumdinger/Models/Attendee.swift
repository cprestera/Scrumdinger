//
//  Attendee.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 10/29/25.
//

import Foundation
import SwiftData

@Model
class Attendee: Identifiable {
    var id: UUID
    var name: String
    var dailyScrum: DailyScrum?


    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
