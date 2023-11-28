//
//  EmojiMemoryGameView.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/23/23.
//
//EmojiMemoryGameView is a view onto an EmojiMemoryGameViewModel
import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
            .padding()
    }
    
    
    var cards: some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            //up to and not including 4, ...4 includes 4
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(Color.orange)
    }
    
}

 
struct CardView: View {
//    let content: String
//    @State var isFaceUp = true
    
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    //if this font is too big, you can scale it down to 1/100 of its size
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
//                    .font(.largeTitle)
            }
            //putting card.(isFaceup) changed this CardView into truly a CardView, it is a view on a card
//            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0: 1)
        }
//        .onTapGesture {
//            isFaceUp.toggle()
//            print("tapped")
//        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
