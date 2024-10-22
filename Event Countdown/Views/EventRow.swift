//
//  EventRow.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    @State private var timeRemaining: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter = RelativeDateTimeFormatter()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            
            Text(timeRemaining)
                .onAppear(perform: updateTimeRemaining)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
        }
    }
    
    private func updateTimeRemaining() {
        timeRemaining = formatter
            .localizedString(for: event.date, relativeTo: Date.now)
    }
}


#Preview {
    EventRow(
        event: Event(
            title: "Event Name",
            description: "This is an event",
            date: .now,
            textColor: .mint
        )
    )
}
