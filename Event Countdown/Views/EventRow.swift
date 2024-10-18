//
//  EventRow.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    var body: some View {
        VStack (alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            
            Text(event.date.formatted(.relative(presentation: .named)).capitalized)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
        }
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
