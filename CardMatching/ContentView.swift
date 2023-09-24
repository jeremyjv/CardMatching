//
//  ContentView.swift
//  CardMatching
//
//  Created by Jeremy Villanueva on 9/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.teal)
        
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                
                    .strokeBorder(lineWidth: 10)
                    .foregroundColor(.teal)
                
                Text("☃️")
            } else {
                RoundedRectangle(cornerRadius: 12)
                
            }
        
                        
        }
        
        .padding()
    }

}
