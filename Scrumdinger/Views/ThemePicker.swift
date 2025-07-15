//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Cameron John Prestera on 7/14/25.
//

import SwiftUI
import ThemeKit

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    @Previewable @State var theme = Theme.periwinkle
    ThemePicker(selection: $theme)
}
