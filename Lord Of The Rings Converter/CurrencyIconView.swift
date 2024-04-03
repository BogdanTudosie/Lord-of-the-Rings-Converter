//
//  CurrencyIconView.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 3.4.2024.
//

import SwiftUI

struct CurrencyIconView: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        // Currency Icons
        ZStack(alignment: .bottom) {
            // Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .background(.brown)
        .frame(width: 100, height: 100)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIconView(currencyImage: .copperpenny, currencyName: "Copper Penny")
}
