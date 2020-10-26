//
//  ContentView.swift
//  SliderGame
//
//  Created by Evgenia Shipova on 26.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var score = 100
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                ColorUISLider(currentValue: $currentValue, targetValue: $targetValue, score: $score)
                Text("100")
            }
            .padding()
            Button("Проверь меня") {
               showAlert = true
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your score"), message: Text("\(score)"))
            })
            .padding()
            Button("Начать заново", action: {
                targetValue = Int.random(in: 0...100)
            })
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
