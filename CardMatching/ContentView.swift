//
//  ContentView.swift
//  CardMatching
//
//  Created by Jeremy Villanueva on 9/24/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["❄️","☃️","🎄","🛷","☃️","🎄","🛷","☃️","🎄","🛷","☃️","🎄","🛷"]
    @State var CardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            HStack {
                CardRemover
                Spacer()
                CardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: { //pass different parameters into button
            if CardCount > 0 {
                CardCount += offset
            }
            
        }, label: {
            Image(systemName: symbol)
        
        })
        .disabled(CardCount + offset < 1 || CardCount + offset > emojis.count)
    }
    
    var CardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var CardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<CardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        
        .onTapGesture {
            isFaceUp.toggle()
            
        }
        
        .padding()
    }
}



