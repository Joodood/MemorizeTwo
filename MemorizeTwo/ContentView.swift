//
//  ContentView.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽" ]
    
    @State var cardCount: Int = 4
    
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    

    
    var cards: some View {
        HStack {
            //up to and not including 4, ...4 includes 4
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
    }
        .foregroundColor(.orange)
    }
    
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            
        }, label: {
            Image(systemName: "symbol")
        })
        
    }
    
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount = cardCount - 1
            }
            
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
            
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
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
            print("tapped")
        }
    }
}

#Preview {
    ContentView()
}
