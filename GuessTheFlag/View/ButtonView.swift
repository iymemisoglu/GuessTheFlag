//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 4.09.2025.
//

import SwiftUI

struct ButtonView: View {
    
    @Bindable var guessFlagViewModel : GuessFlagViewModel
    
    var body: some View {
        VStack {  // Three Button cascade vertically
            ForEach(0..<3) { index in
                Button {
                    guessFlagViewModel.flagTapped(index)
                    
                } label: {
                    Image(guessFlagViewModel.countryKeys[index])
                        .resizable()
                        .frame(width: 250, height: 150)
                        .clipShape(.buttonBorder)
                        .padding()
                }
            }
        }
    }
}

