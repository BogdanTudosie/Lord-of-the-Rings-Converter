//
//  Currency.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 3.4.2024.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    var id: Double { rawValue }
    
    
    // enum cases
    case copperPenny = 6400.0
    case silverPenny = 64.0
    case silverPiece = 16.0
    case goldPenny = 4.0
    case goldPiece = 1.0
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
            
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
}

