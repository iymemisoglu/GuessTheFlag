//
//  FlagQuestions.swift
//  GuessTheFlag
//
//  Created by İlker Memişoğlu on 4.09.2025.
//

import SwiftUI

@Observable class GuessFlagViewModel  {
    
     var country = Country.names
     var score = 0
     var countryKeys = Array(Country.names.keys).shuffled()
     var randomNumber = Int.random(in: 0..<3)
     var totalNumberOfQuestions = 0
     var showAlert: Bool = false
    
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
        print(randomNumber)
        countryKeys.shuffle()
    }
    
    func askQuestion() {
        
        countryKeys.shuffle()
        randomNumber = Int.random(in: 0..<3)
    }
    func endGame () {
        score = 0
        totalNumberOfQuestions = 0
    }
}
