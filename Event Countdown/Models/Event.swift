//
//  Event.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import Foundation
import SwiftUI


struct Event: Comparable, Identifiable, Hashable {
    
    // Makes the Event conform to the Comparable protocol
    static func < (lhs: Event, rhs: Event) -> Bool {
        // Compares the dates
        if lhs.date != rhs.date {
            return lhs.date < rhs.date
        // If the dates are the same, then compare title
        } else if lhs.title != rhs.title {
            return lhs.title < rhs.title
        // Compares the descriptions if the titles are the same
        } else {
            return lhs.description < rhs.description
        }
    }
    
    var id = UUID()
    var title: String
    var description: String
    var date: Date
    var textColor: Color
    
    struct MockData {
        let events: [Event] = [
            Event(
                title: "My Birthday",
                description: "22nd Birthday",
                date: .now,
                textColor: .mint
            ),
            
            Event(
                title: "Anniversary",
                description: "1 Year Anniversary",
                date: .now,
                textColor: .pink
            )
        ]
    }
    
}

enum Mode {
    case add
    case edit(Event)
}
