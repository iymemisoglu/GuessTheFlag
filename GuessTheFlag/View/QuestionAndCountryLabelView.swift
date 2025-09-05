//
//  QuestionAndCountryLabelView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 4.09.2025.
//

import SwiftUI

struct QuestionAndCountryLabelView: View {
    
    @Bindable var guessFlagFunctions : GuessFlagViewModel
    
    var body: some View {
        VStack {
            //HStack View properties
            HStack {
                Label("Bayrağı Tahmin Et", systemImage: "")
                    .padding(10)
                    .font(.title)
                    .fontWeight(.bold)
                    .buttonBorderShape(.capsule)
                    .foregroundStyle(.yellow)
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.yellow)
                
            }
            .background(Color.black)
            .clipShape(.capsule)
            
            // Label for country name
            Label(guessFlagFunctions.country[guessFlagFunctions.countryKeys[guessFlagFunctions.randomNumber]]! , image: "")
                .font(.title2)
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

