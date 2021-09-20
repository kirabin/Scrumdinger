//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by kirabin on 19.9.2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
                    .navigationTitle("Daily Scrums")
            }
        }
    }
}
