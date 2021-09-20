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
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            })
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
