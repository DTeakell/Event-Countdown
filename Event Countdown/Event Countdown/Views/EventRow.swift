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
    @State private var now = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter = RelativeDateTimeFormatter()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            
            Text(dateDescription(for: event.date, relativeTo: now))
                .onReceive(timer) { date in
                    now = date
                }
                .font(.subheadline)
                .foregroundStyle(.gray)
            
        }
    }
    
    // Method to compare dates
    private func dateDescription(for date: Date, relativeTo anotherDate: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.dateTimeStyle = .named
        return formatter.localizedString(for: date, relativeTo: anotherDate)
    }
    
    // Method to update time
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
