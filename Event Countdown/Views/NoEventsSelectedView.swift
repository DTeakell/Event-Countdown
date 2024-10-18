//
//  NoEventsView.swift
//  Event Countdown
//
//  Created by Dillon Teakell on 10/9/24.
//

import SwiftUI

struct NoEventSelectedView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "calendar")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(uiColor: .systemGray))
         
            Text("No Event Selected")
                .font(.callout)
            
            // TODO: Integrate with TipKit to enable Tips for first-time users
            
            
        }
    }
}

#Preview {
    NoEventsView()
}
