//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ezenwa Okoro on 09/09/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio = 2/3 as CGFloat
    private let spacing = 4 as CGFloat
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
    // MARK: - Intents
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
