//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 4.09.2025.
//

import SwiftUI

struct ScoreLabelView: View {
    
    @Bindable var guessFlagViewModel : GuessFlagViewModel
    
    var body: some View {
        HStack {
            Spacer()
            // Score Label Properties
            Label("Score: \(guessFlagViewModel.score)/\(guessFlagViewModel.totalNumberOfQuestions)", systemImage: "info.circle")
                .frame(alignment: .center)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
                .padding()
            
        }
    }
}


