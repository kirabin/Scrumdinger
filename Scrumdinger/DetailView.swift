//
//  DetailView.swift
//  Scrumdinger
//
//  Created by kirabin on 20.9.2021.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()

    var body: some View {
        List {
            Section(header: Text("Meeting Info"), content: {
                NavigationLink(
                    destination: MeetingView(),
                    label: {
                        Label("Start Meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("Start meeting"))
                    })
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            })
            
            Section(header: Text("Attendees"), content: {
                ForEach(scrum.attendees, id: \.self, content: { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                })
            })
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            data = scrum.data
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        scrum.update(from: data)
                    })
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
