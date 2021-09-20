//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by kirabin on 19.9.2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
                    .navigationTitle("Daily Scrums")
            }
        }
    }
}
