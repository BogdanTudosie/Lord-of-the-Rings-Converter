//
//  SelectCurrencyView.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 3.4.2024.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the curency you wish to exchange:").fontWeight(.bold)
                
                // Currency Icons
                IconGrid(currency: $fromCurrency)
                
                Text("Select the currency you are converting to: ").fontWeight(.bold)
                
                // Currency Icons for target currency
                // ----------------------------------
                
                IconGrid(currency: $toCurrency)
                
                // Done Button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .font(.largeTitle)
                    .padding(.bottom)
            }
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    SelectCurrencyView(fromCurrency: .constant(.copperPenny), toCurrency: .constant(.silverPiece))
}
