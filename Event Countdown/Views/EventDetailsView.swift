//
//  EventDetailsView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/14/24.
//

import SwiftUI

struct EventDetailsView: View {
    
    let event: Event
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = .now
    @State private var textColor: Color = .primary
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       Text("")
    }
}

#Preview {
    EventDetailsView(event: Event.MockData().events[0])
}
