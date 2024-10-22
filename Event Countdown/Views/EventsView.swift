//
//  EventsView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import SwiftUI

struct EventsView: View {
    
    @State var events: [Event] = []
    
    // Create a new event boolean to toggle the EventFormView
    @State private var isAddingNewEvent: Bool = false
    
    // Create an event variable to keep track of selected event
    @State private var selectedEvent: Event? = nil
    
    // Create a edit event boolean to edit an existing event
    @State private var isShowingEditView: Bool = false
    
    // User can select an accent color for the app
    @State private var accentColor: Color = .mint
    
    
    var body: some View {
        
        NavigationStack {
            
            // Show an empty screen if the list is empty
            if events.isEmpty {
                VStack {
                    NoEventsView()
                        .padding(.vertical, 20)
                    NavigationLink(
                        destination: EventFormView(mode: .add) { event in
                            withAnimation {
                                events.append(event)
                            }
                        }
                    ) {
                        Label("Create Event", systemImage: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                
                // List of Events
                List (events.sorted()) { event in
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
                        NavigationLink(
                            destination: EventFormView(mode: .add) { event in
                                withAnimation {
                                    events.append(event)
                                }
                            }
                        ) {
                            Label("Create Event", systemImage: "plus")
                        }
                    }
                }
                .navigationDestination(for: Event.self) { event in
                    EventFormView(mode: .edit(event)) { updatedEvent in
                        if let index = events.firstIndex(where: { $0.id == updatedEvent.id }){
                            events[index] = updatedEvent
                        }
                    }
                }
            }
            
            
            //TODO: Add a color picker for the user to select an accent color for the app
        }
        .tint(.mint)
            
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
