//
//  RingProgressArc.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/21/22.
//

import SwiftUI

struct RingProgressArc: InsettableShape {
    var progress: Double
    var insetAmount: Double = 0
    let name: String
    
    func path(in rect: CGRect) -> Path {
        let startAngle = Angle(degrees: 0)
        let endAngle = Angle(degrees: 360.0 * progress)
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        
        var path = Path()
        path.addArc(center: rect.mid, radius: radius - insetAmount, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount = amount
        return arc
    }
}

extension CGRect {
    var mid: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
