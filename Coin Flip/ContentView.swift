//
//  ContentView.swift
//  Coin Flip
//
//  Created by Yuna on 7/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var prediction = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter your prediction")
                    .font(.system(size: 25))
                    .padding()
                Picker("", selection: $prediction) {
                    Text("Heads").tag(1)
                    Text("Tails").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 350, height: 20, alignment: .center)
                .padding()
                .padding(.bottom, 30)
                .font(.system(size: 18))
            }
            .padding(.bottom, 150)
            .navigationTitle("Coin Flip")
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
