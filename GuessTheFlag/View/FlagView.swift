//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 30.08.2025.
//

import SwiftUI

struct FlagView: View {
    
    @State  var guessFlagViewModel = GuessFlagViewModel()
    
    var body: some View {
        
        ZStack {
            //Background Properties
            RadialGradient(colors: [.yellow, .black], center: .top, startRadius: 150, endRadius: 400)
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                ScoreLabelView(guessFlagFunctions: guessFlagViewModel)
                Spacer()
                QuestionAndCountryLabelView(guessFlagFunctions: guessFlagViewModel)
                ButtonView(guessFlagFunctions: guessFlagViewModel)
                Spacer()
                Spacer()
            }
            .alert("Bayrak Tahmin Oyunu", isPresented: $guessFlagViewModel.showAlert) {
                Button("Devam", action: guessFlagViewModel.askQuestion)
                Button("Bitir", action: guessFlagViewModel.endGame)
            } message: {
                Text("Skorunuz \(guessFlagViewModel.score)/\(guessFlagViewModel.totalNumberOfQuestions) devam etmek istiyor musunuz ?")
            }
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    FlagView()
}
