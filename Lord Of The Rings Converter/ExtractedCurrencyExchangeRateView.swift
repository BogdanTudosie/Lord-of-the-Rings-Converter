//
//  ExtractedCurrencyExchangeRateView.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 2.4.2024.
//

import SwiftUI

struct ExtractedCurrencyExchangeRateView: View {
    let left: ImageResource
    let text: String
    let right: ImageResource
    
    var body: some View {
        HStack {
            Image(left)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            
            Image(right)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExtractedCurrencyExchangeRateView(left: .goldpiece, text: "1 piece = 4 gold pennies", right: .goldpenny)
}
