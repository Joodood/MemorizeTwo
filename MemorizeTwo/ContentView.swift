//
//  ContentView.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽"]
    
    @State var cardCount: Int = 4
    
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
          
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    var cards: some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem()]){
            //up to and not including 4, ...4 includes 4
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
    
  //two arg 1-which way ur going, 2- the symbol
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            //dont put quotes around symbol
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    //your the caller so u use by not 'offset'
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}






struct CardView: View {
    
    let content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        
         
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
//            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0: 1)
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
