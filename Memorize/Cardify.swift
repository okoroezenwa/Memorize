//
//  Cardify.swift
//  Memorize
//
//  Created by Ezenwa Okoro on 11/09/2023.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base
                .strokeBorder(lineWidth: Constants.lineWidth)
                .background(
                    base
                        .fill(Color.white)
                )
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            
            base
                .fill()
                .opacity(isFaceUp ? 0 : 1)
        }
    }
}

extension Cardify {
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
