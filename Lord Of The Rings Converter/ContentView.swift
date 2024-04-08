//
//  ContentView.swift
//  Lord Of The Rings Converter
//
//  Created by Bogdan Tudosie on 2.4.2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    // amounts as string
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    // FOcus state properties
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    // actual currency
    @State var fromCurrency: Currency = .silverPiece
    @State var toCurrency: Currency = .goldPenny
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            
            // Vertical Stack holding everything else
            VStack {
                // prancing pony
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack {
                    VStack {
                        HStack {
                            Image(fromCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(fromCurrency.name).font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        TextField("\(fromCurrency.name): ", text: $leftAmount).textFieldStyle(.roundedBorder).keyboardType(.decimalPad)
                            .focused($leftTyping)
                    }
                    
                    Image(systemName: "equal").foregroundColor(.white).font(.largeTitle).symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(toCurrency.name).font(.headline).foregroundStyle(.white)
                            Image(toCurrency.image).resizable().scaledToFit().frame(height: 33)

                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        //Text Field
                        TextField("\(toCurrency.name): ", text: $rightAmount).textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing).keyboardType(.decimalPad)
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundColor(.white)
                    }
                    .padding(.trailing)
                    .padding(.bottom)
                    
                }
            }
            .task {
                try? Tips.configure()
            }
            .onChange(of: leftAmount) {
                if leftTyping {
                    rightAmount = fromCurrency.convert(leftAmount, to: toCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = toCurrency.convert(rightAmount, to: fromCurrency)
                }
            }
            .onChange(of: fromCurrency) {
                rightAmount = fromCurrency.convert(leftAmount, to: toCurrency)
            }
            .onChange(of: toCurrency) {
                leftAmount = toCurrency.convert(rightAmount, to: fromCurrency)
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeRateInfoView()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrencyView(fromCurrency: $fromCurrency, toCurrency: $toCurrency)
            }
            .onTapGesture() {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

#Preview {
    ContentView()
}
