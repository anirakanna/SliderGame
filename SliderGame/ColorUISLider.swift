//
//  UISLider.swift
//  SliderGame
//
//  Created by Evgenia Shipova on 26.10.2020.
//

import SwiftUI

struct ColorUISLider: UIViewRepresentable {
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    @Binding var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .blue
        slider.value = Float(currentValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.alpha = CGFloat(Double(score)/100)
    }
    
    func makeCoordinator() -> ColorUISLider.Coordinator {
        Coordinator(value: $currentValue,
                    randomNumber: $targetValue,
                    score: $score)
    }
}

extension ColorUISLider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        @Binding var targetValue: Int
        @Binding var score: Int
        
        init(value: Binding<Double>, randomNumber: Binding<Int>, score: Binding<Int>) {
            self._currentValue = value
            self._targetValue = randomNumber
            self._score = score
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
            score = computeScore()
        }
        
        func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue))
            return 100 - difference
        }
    }
}

struct ColorUISLider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISLider(currentValue: .constant(34.0), targetValue: .constant(34), score: .constant(100))
    }
}
