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
        return lhs.date < rhs.date
    }
    
    let id = UUID()
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
