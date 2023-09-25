//
//  ContentView.swift
//  CardMatching
//
//  Created by Jeremy Villanueva on 9/24/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["❄️","☃️","🎄","🛷","☃️","🎄","🛷"]
    @State var CardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            HStack {
                CardRemover
                Spacer()
                CardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        
    }
    
    var CardRemover: some View {
        Button(action: { //pass different parameters into button
            if CardCount > 1 {
                CardCount -= 1
            }
            
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        
        })
    }
    
    var CardAdder: some View {
        Button(action: { //pass different parameters into button
            if CardCount < emojis.count {
                CardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        
        })
    }
    var cards: some View {
        HStack {
            ForEach(0..<CardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            
            .foregroundColor(.teal)
            
        }
    }
}
    


#Preview {
    ContentView()
}



struct CardView: View {
    
    //Parameters of CardView Struct

    @State var isFaceUp: Bool = false //state is a pointer
    let content: String
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base.fill()
                
            }
        
                        
        }
        .onTapGesture {
            isFaceUp.toggle()
            
        }
        
        .padding()
    }

}
