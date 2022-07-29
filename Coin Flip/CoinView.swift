//
//  CoinView.swift
//  Coin Flip
//
//  Created by Yuna on 7/24/22.
//

import SwiftUI

struct CoinView: View {
    @State private var isRotated = false
    @State private var coinImage = "Heads"
    @State private var gameOver = false
    @State private var winMessage = ""
    @State private var isPlaying = false
    @Environment(\.presentationMode) var presentationMode
    var animation: Animation {
        Animation.linear
            .repeatForever(autoreverses: false)
            .speed(2.0)
    }
    let prediction: Int
    var body: some View {
        
        VStack {
            Button {
                self.isRotated.toggle()
            } label: {
                Text("Flip the coin")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(width: 500, height: 200, alignment: .center)
            }
            ZStack {
                Image(coinImage)
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .rotation3DEffect(Angle.degrees(isRotated ? 360 : 0), axis: (x: 1, y: 0, z: 0))
                    .animation(animation)
                    .opacity(isPlaying ? 0 : 1)
                
                Image(coinImage)
                    .resizable()
                    .frame(width: 350, height: 350, alignment: .center)
                    .opacity(isPlaying ? 1 : 0)
            }
            
            Button {
                buttonPressed()
                self.isPlaying.toggle()
            } label: {
                Text("See the result!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .frame(width: 500, height: 200, alignment: .center)
                    .padding(.bottom, 100)
            }
            
            .alert(isPresented: $gameOver) {
                Alert(title: Text(winMessage),dismissButton: .destructive(Text("Play again"), action: {
                    withAnimation {
                        coinImage = "Heads"
                        gameOver = false
                        self.presentationMode.wrappedValue.dismiss()
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

