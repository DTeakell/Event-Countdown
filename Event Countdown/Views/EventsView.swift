//
//  EventsView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import SwiftUI

struct EventsView: View {
    
    @State var events: [Event] = Event.MockData().events
    
    // Create a new event boolean to show the add event form
    @State private var isShowingNewEventView: Bool = false
    
    // Create a edit event boolean to edit an existing event
    @State private var isShowingEditView: Bool = false
    
    // User can select an accent color for the app
    @State private var accentColor: Color = .mint
    
    
    var body: some View {
        
        // For iPad layout
        NavigationSplitView {
            
            // Show an empty screen if the list is empty
            if events.isEmpty {
                NoEventsView()
            }
            
            // List of Events
            List (events) { event in
                // Navigate to the EventFormView to edit event
                NavigationLink(destination: EventFormView(mode: .edit(event)) { updatedEvent in
                    if let index = events.firstIndex(where: {$0.id == event.id}) {
                        events[index] = updatedEvent
                    }
                }) {
                    EventRow(event: event)
                }
                
                // Swipe action to delete an event
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            removeEvent(event: event)
                        }
                    } label: {
                        Label("Remove", systemImage: "trash")
                            .tint(.red)
                    }
                }
        }
            .navigationTitle("Events")
            .toolbar {
                // Create new event button
                ToolbarItem {
                    Button {
                        // Toggles the sheet to show
                        isShowingNewEventView.toggle()
                    } label: {
                        Label("New Event", systemImage: "plus")
                    }
                }
            }
            
            //TODO: Add a color picker for the user to select an accent color for the app
            
            
            // For iPad and if there is no event selected
        } detail: { NoEventSelectedView() }.tint(accentColor)
        
        // Add Event Sheet
            .sheet(isPresented: $isShowingNewEventView) {
                EventFormView(mode: .add) {event in
                    withAnimation {
                        events.append(event)
                    }
                }
            }
    }
    
    // Helper Function to remove an event from the list
    func removeEvent(event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            events.remove(at: index)
        }
    }
}

#Preview {
    EventsView()
}
