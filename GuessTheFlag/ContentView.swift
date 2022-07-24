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
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 20) {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundColor(.white)
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack {
                    Text("Round: \(round)/10")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
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
