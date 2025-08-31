//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 30.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    
    private var countryNames = Country.names
    
    @State private var score = 0
    @State private var keys = Array(Country.names.keys).shuffled()
    @State private var values = Array(Country.names.values)
    @State private var randomNumber = Int.random(in: 0..<3)
    @State private var totalNumberOfQuestions = 0
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        
        
        ZStack {
            //Background Properties
            RadialGradient(colors: [.yellow, .black], center: .top, startRadius: 150, endRadius: 400)
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                
                // Score Label Properties
                Label("Score: \(score)/\(totalNumberOfQuestions)", systemImage: "info.circle")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .topTrailing)
                    .padding()
                
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
                    Label(countryNames[keys[randomNumber]] ?? "", image: "")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack {  // Three Button cascade vertically
                    ForEach(0..<3) { index in
                        Button {
                            flagTapped(index)
                            
                        } label: {
                            Image(keys[index])
                                .resizable()
                                .frame(width: 250, height: 150)
                                .clipShape(.buttonBorder)
                                .padding()
                        }
                    }
                }
                Spacer()
                Spacer()
            }.alert("Bayrak Tahmin Oyunu", isPresented: $showAlert) {
                Button("Devam", action: askQuestion)
                Button("Bitir", action: endGame)
            } message: {
                Text("Skorunuz \(score)/\(totalNumberOfQuestions) devam etmek istiyor musunuz ?")
            }
            
            Spacer()
            Spacer()
        }
 
    }
    
    
    func flagTapped(_ number: Int) {
        
        totalNumberOfQuestions += 1
        if number == randomNumber {
            score += 1
        }
        
        showAlert = (totalNumberOfQuestions%10 == 0) ? true : false
//        if totalNumberOfQuestions%10  == 0 {
//            showAlert = true
//            
//        } else {
//            showAlert = false
//        }
        randomNumber = Int.random(in: 0..<3)
        keys.shuffle()
    }
    
    
    
    func askQuestion() {
        
        keys.shuffle()
        randomNumber = Int.random(in: 0..<3)
    }
    func endGame () {
        score = 0
        totalNumberOfQuestions = 0
    }
}

#Preview {
    ContentView()
}
