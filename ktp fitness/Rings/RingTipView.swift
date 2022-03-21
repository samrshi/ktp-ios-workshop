//
//  RingTipView.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct RingTipView: View {
    let progress: Double
    let ringRadius: Double
    let ringThickness: Double
    let color: Color

    var body: some View {
        RingTipShape(progress: progress, ringRadius: ringRadius)
            .fill(circleFill)
            .frame(width: ringThickness, height: ringThickness)
            .shadow(color: shadowColor, radius: ringRadius * 0.00033, x: shadowOffset.x, y: shadowOffset.y)
    }
    
    var circleFill: Color {
        if progress > 0.95 {
            return color
        } else {
            return color
        }
    }
    
    var shadowColor: Color {
        progress > 0.95 ? .black.opacity(0.5) : .clear
    }
    
    var shadowOffset: CGPoint {
        let ringPosition = positionForProgress(percent: progress)
        let shadowPosition = positionForProgress(percent: progress + 0.006)
        
        return CGPoint(x: shadowPosition.x - ringPosition.x,
                       y: shadowPosition.y - ringPosition.y)
    }

    func positionForProgress(percent: Double) -> CGPoint {
        let progressAngle = Angle(degrees: (360.0 * percent) - 90.0)

        let x = ringRadius * cos(progressAngle.radians)
        let y = ringRadius * sin(progressAngle.radians)

        return CGPoint(x: x, y: y)
    }
}

struct RingTipView_Previews: PreviewProvider {
    static var previews: some View {
        RingTipView(progress: 1.33, ringRadius: 150, ringThickness: 20, color: .blue)
    }
}
