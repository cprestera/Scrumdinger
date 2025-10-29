//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 10/29/25.
//

import SwiftUI

struct NewScrumSheet: View {    
    var body: some View {
        NavigationStack {
            DetailsEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
