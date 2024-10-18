//
//  NewEventView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/10/24.
//

import SwiftUI

struct NewEventView: View {
    
    // Enum to determine which mode the view will take on
    enum Mode {
        case add,
        case edit(Event)
    }
    @Binding var events: [Event]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = .now
    @State private var textColor: Color = .primary
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Event Name") {
                    TextField("Title", text: $title)
                }
                
                Section("Event Description") {
                    TextEditor(text: $description)
                }
                
                
                DatePicker("Date", selection: $date)
                
                
                Section ("Style Details") {
                    ColorPicker("Accent Color", selection: $textColor)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button ("Add Event") {
                        events
                            .append(
                                Event(
                                    title: title,
                                    description: description,
                                    date: date,
                                    textColor: textColor
                                )
                            )
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Event")
        }
    }
}
