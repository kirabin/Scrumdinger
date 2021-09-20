//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by kirabin on 20.9.2021.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums, content: { scrum in
                NavigationLink(
                    destination: DetailView(scrum: scrum),
                    label: {
                        CardView(scrum: scrum)
                })
                    .listRowBackground(scrum.color)
            })
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image(systemName: "plus")
        }))
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
