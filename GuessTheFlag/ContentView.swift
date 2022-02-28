//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Garret Poole on 2/9/22.
//

import SwiftUI
struct FlagImage: View{
    var country: String
    
    var body: some View{
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct BackgroundFlag: View{
    var color: Color
    
    var body: some View{
        Capsule(style: .circular).fill(color).blur(radius: 30)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingFinalScore = false
    
    @State private var scoreTitle = ""
    @State private var finalTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var currentScore = 0
    @State private var questionCount = 0
    
    //animations
    @State private var selectedFlag = 0
    @State private var animationAmount = 0.0
    @State private var animateOpacity = 1.0
    @State private var scaleAmount = 1.0
    @State private var wrongFlag = Color.clear
    @State private var correctFlag = Color.clear
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.75, green: 0.15, blue: 0.3), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("GUESS THE FLAG")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            withAnimation{
                                animationAmount += 360
                                animateOpacity -= 0.5
                                wrongFlag = Color.red
                                correctFlag = Color.green
                                scaleAmount -= 0.2
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(selectedFlag == number ? .degrees(animationAmount) : .degrees(0.0), axis: (x: 0, y: 1, z: 0))
                        .opacity(correctAnswer == number ? 1.0 : animateOpacity)
                        .background(correctAnswer == number ?
                                    BackgroundFlag(color:correctFlag) : BackgroundFlag(color: wrongFlag))
                        .scaleEffect(correctAnswer == number ? 1 : scaleAmount)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("SCORE: \(currentScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(currentScore)")
        }
        .alert(finalTitle, isPresented: $showingFinalScore){
            Button("Continue"){
                resetGame()
                askQuestion()
            }
        } message: {
            Text("Final Score: \(currentScore)/\(questionCount)")
        }
            
    }
    
    func flagTapped(_ number: Int){
        selectedFlag = number
        if number == correctAnswer{
            scoreTitle = "Correct"
            currentScore += 1
        }
        else{
            scoreTitle = """
                    Wrong
                    That is the flag of \(countries[number])
                    """
        }
        questionCount += 1
        if questionCount == 8{
            if currentScore > 6{
                finalTitle = "You know your flags!!"
            }
            else{
                finalTitle = "You should study..."
            }
            showingFinalScore = true
        }
        else{
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        //animation
        animateOpacity = 1.0
        scaleAmount = 1.0
        wrongFlag = Color.clear
        correctFlag = Color.clear
    }
    
    func resetGame() {
        questionCount = 0
        currentScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
