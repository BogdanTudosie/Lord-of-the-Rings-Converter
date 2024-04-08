//
//  CurrencyTip.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 8.4.2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? {
        Text("You can tap the left or right currency to bring up the currencies selection screen.")
    }
}
