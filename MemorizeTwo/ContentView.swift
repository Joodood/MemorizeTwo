//
//  ContentView.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽"]
    
    var body: some View {
            ScrollView {
                cards
            }
            .padding()
    }
    
    
    var cards: some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem()]){
            //up to and not including 4, ...4 includes 4
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
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
