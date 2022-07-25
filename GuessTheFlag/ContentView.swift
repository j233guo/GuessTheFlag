//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jiaming Guo on 2022-07-21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var round = 1
    @State private var message = ""
    @State private var buttonTitle = ""
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "You are correct!" : "Sorry, that was wrong"
        score += number == correctAnswer ? 1 : 0
        if round == 10 {
            message = "You have scored \(score) this game."
            if score >= 9 { message += "\nNice job!" }
            buttonTitle = "Start a New Game"
        } else {
            message = "Your score is now \(score)"
            buttonTitle = "Next Round"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        if round >= 10 {
            round = 1
        } else {
            round += 1
        }
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                LargeText(text: "Guess the Flag")
                VStack(spacing: 20) {
                    SmallText(text: "Tap the flag of")
                    LargeText(text: countries[correctAnswer])
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(flagName: countries[number])
                        }
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack {
                    MediumText(text: "Round: \(round)/10")
                    Spacer()
                    MediumText(text: "Score: \(score)")
                }
                .padding()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(buttonTitle, action: askQuestion)
        } message: {
            Text(message)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
