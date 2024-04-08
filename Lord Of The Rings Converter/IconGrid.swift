//
//  IconGrid.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 3.4.2024.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIconView(currencyImage: currency.image,
                                     currencyName: currency.name)
                    .shadow(color: .black, radius: 10.3)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(lineWidth: 3.0)
                            .opacity(0.3)
                        
                    }
                } else {
                    CurrencyIconView(currencyImage: currency.image,
                                     currencyName: currency.name)
                    .onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
