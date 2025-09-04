//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 30.08.2025.
//

import SwiftUI

struct FlagView: View {
    
    private var countryNames = Country.names
    @ObservedObject var flagFunctions = GuessFlagFunctions()
    
    var body: some View {
        
        ZStack {
            //Background Properties
            RadialGradient(colors: [.yellow, .black], center: .top, startRadius: 150, endRadius: 400)
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    // Score Label Properties
                    Label("Score: \(flagFunctions.score)/\(flagFunctions.totalNumberOfQuestions)", systemImage: "info.circle")
                        .frame(alignment: .center)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                    
                }
                
                Spacer()
                // VStack View Properties
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
                    Label(countryNames[flagFunctions.countryKeys[flagFunctions.randomNumber]] ?? "", image: "")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack {  // Three Button cascade vertically
                    ForEach(0..<3) { index in
                        Button {
                            flagFunctions.flagTapped(index)
                            
                        } label: {
                            Image(flagFunctions.countryKeys[index])
                                .resizable()
                                .frame(width: 250, height: 150)
                                .clipShape(.buttonBorder)
                                .padding()
                        }
                    }
                }
                Spacer()
                Spacer()
            }
            .alert("Bayrak Tahmin Oyunu", isPresented: $flagFunctions.showAlert) {
                Button("Devam", action: flagFunctions.askQuestion)
                Button("Bitir", action: flagFunctions.endGame)
            } message: {
                Text("Skorunuz \(flagFunctions.score)/\(flagFunctions.totalNumberOfQuestions) devam etmek istiyor musunuz ?")
            }
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    FlagView()
}
