//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 30.08.2025.
//

import SwiftUI

struct FlagView: View {
    
    
     @ObservedObject var guessFlagFunctions = GuessFlagFunctions()
    
    var body: some View {
        
        ZStack {
            //Background Properties
            RadialGradient(colors: [.yellow, .black], center: .top, startRadius: 150, endRadius: 400)
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                ScoreLabelView()
                Spacer()
                QuestionAndCountryLabelView()
                ButtonView()
                Spacer()
                Spacer()
            }
            .alert("Bayrak Tahmin Oyunu", isPresented: $guessFlagFunctions.showAlert) {
                Button("Devam", action: guessFlagFunctions.askQuestion)
                Button("Bitir", action: guessFlagFunctions.endGame)
            } message: {
                Text("Skorunuz \(guessFlagFunctions.score)/\(guessFlagFunctions.totalNumberOfQuestions) devam etmek istiyor musunuz ?")
            }
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    FlagView()
}
