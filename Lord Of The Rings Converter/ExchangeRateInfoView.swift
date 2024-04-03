//
//  ExchangeRateInfoView.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 2.4.2024.
//

import SwiftUI

struct ExchangeRateInfoView: View {
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Exchange Rate").font(.largeTitle).tracking(3)
                
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:").font(.title2).padding()
                
                // conversion information
                ExtractedCurrencyExchangeRateView(left:.goldpiece, text: "1 piece = 4 gold pennies", right: .goldpenny)
                ExtractedCurrencyExchangeRateView(left: .goldpenny, text: "1 gold penny = 4 silver pieces", right: .silverpiece)
                ExtractedCurrencyExchangeRateView(left: .silverpiece, text: "1 silver piece = 4 silver pennies", right: .silverpenny)
                ExtractedCurrencyExchangeRateView(left: .silverpenny, text: "1 Silver penny = 100 copper pennies", right: .copperpenny)
                
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    ExchangeRateInfoView()
}
