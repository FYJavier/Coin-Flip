//
//  CoinView.swift
//  Coin Flip
//
//  Created by Yuna on 7/24/22.
//

import SwiftUI

struct CoinView: View {
    @State private var isRotated = false
    @State private var isTails = false
    @State private var coinImage = "Heads"
    @State private var gameOver = false
    @State private var winMessage = ""
    let prediction: Int
    var body: some View {
        VStack {
            Text("Flip the coin")
            Button(action: {
                buttonPressed()
            }) {
                
                ZStack {
                    Image(coinImage)
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    //                    Image("Tails")
                    //                        .resizable()
                    //                        .frame(width: 300, height: 300, alignment: .center)
                    //                        .opacity(buttonPressed() == notHeads() ? 1 : 0)
                }
            }
            .alert(isPresented: $gameOver) {
                Alert(title: Text(winMessage),dismissButton: .destructive(Text("Play again"), action: {
                    withAnimation {
                        coinImage = "Heads"
                        gameOver = false
                    }
                }))
                
            }
        }
    }
    func buttonPressed() {
        if Int.random(in: 0...1) == 0 {
            coinImage = "Heads"
            if prediction == 0 {
                winMessage = "You are correct!"
                gameOver = true
            }
            else { winMessage = "Sorry, you are incorrect"
                gameOver = true
            }
        }
        else {
            coinImage = "Tails"
            if prediction == 1 {
                winMessage = "You are correct!"
                gameOver = true
            }
            else { winMessage = "Sorry, you are incorrect"
                gameOver = true
            }
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(prediction: 0)
    }
}

