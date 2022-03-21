//
//  RingsView.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct RingsView: View {
    let goals: [Goal]
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let radius = min(width, height) / 2
            let spacing: CGFloat = 2
            let ringThickness = radius / (CGFloat(goals.count) + 0.75) - spacing
            
            ZStack {
                ForEach(goals.enumeratedArray(), id: \.element.id) { index, goal in
                    RingView(goal: goal, thickness: ringThickness)
                        .padding(CGFloat(index) * (ringThickness + spacing))
                }
            }
        }
    }
}

struct RingsView_Previews: PreviewProvider {
    static var previews: some View {
        RingsView(goals: Goal.defaults)
    }
}
