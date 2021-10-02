//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by kirabin on 21.9.2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let secondsTotal = secondsElapsed + secondsRemaining
        return Double(secondsElapsed) / Double(secondsTotal)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    let scrumColor: Color
    @Binding var scrum: DailyScrum
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            HStack {
                VStack (alignment: .leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
        .padding([.top, .horizontal])
    }
}


struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 20, secondsRemaining: 180, scrumColor: DailyScrum.data[0].color, scrum: .constant(DailyScrum.data[0]))
            .previewLayout(.sizeThatFits)
    }
}
