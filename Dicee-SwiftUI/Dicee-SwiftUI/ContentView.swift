//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Nasser Tadili Hassani on 10/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 2
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                
                HStack {
                    DiceImage(diceNumber: leftDiceNumber)
                    DiceImage(diceNumber: rightDiceNumber)
                }.padding(.horizontal)
                Spacer()
                
                Button(action: {
                    print("clicked")
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}


struct DiceImage: View {
    let diceNumber: Int
    var body: some View {
        Image("dice\(diceNumber)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(.all)
    }
}

#Preview {
    ContentView()
}
