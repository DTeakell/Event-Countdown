//
//  NewEventView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/10/24.
//

import SwiftUI

struct EventFormView: View {
    
    // Event to add or edit
    @State var event: Event
    
    @Environment(\.dismiss) private var dismiss
    
    // Closure to save the event being added or changed
    let onSave: (Event) -> Void
    
    // Navigation Bar Title
    @State private var navigationTitle: String
    
    // With guidance from Paul Hudson: https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    // With guidance from Swift Documentation: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/
    
    // Custom intializer used to set the mode of the view
    // onSave marked as @escaping because the onSave closure is stored and is potentially called later
    init(mode: Mode, onSave: @escaping (Event) -> Void) {
        self.onSave = onSave
        
        // Switch to run custom init code depending on which mode is being shown
        switch mode {
        case .add:
            // Event with empty data for a new event to be shown
            _event = State(initialValue: Event(title: "", description: "", date: Date(), textColor: .primary))
            navigationTitle = "New Event"
        case .edit(let event):
            // This is the event that is passed into the view and will be edited
            _event = State(initialValue: event)
            navigationTitle = "Edit \(event.title)"
        }
    }
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Event Title") {
                    TextField("Title", text: $event.title)
                        .tint(event.textColor)
                        .foregroundStyle(event.textColor)
                }
                
                Section("Event Description") {
                    TextEditor(text: $event.description)
                        .tint(event.textColor)
                }
                
                Section("Event Date") {
                    // Show only date because most events are all-day
                    DatePicker("Date", selection: $event.date, displayedComponents: .date)
                        .tint(event.textColor)
                }
                
                Section("Style Details") {
                    ColorPicker("Text Color", selection: $event.textColor)
                        .tint(event.textColor)
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .tint(event.textColor)
            .toolbar {
                ToolbarItem (placement: .confirmationAction) {
                    Button("Save") {
                        onSave(event)
                        dismiss()
                    }
                    // Disable the button if the title is empty
                    .disabled(event.title.isEmpty)
                    .tint(.mint)
                }
            }
        }
    }
}
