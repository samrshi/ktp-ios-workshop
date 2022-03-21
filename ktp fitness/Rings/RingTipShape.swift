//
//  RingTipShape.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct RingTipShape: Shape {
    var progress: Double
    var ringRadius: Double

    private var position: CGPoint {
        let progressAngle = Angle(degrees: (360.0 * progress) - 90.0)

        let x = ringRadius * cos(progressAngle.radians)
        let y = ringRadius * sin(progressAngle.radians)

        return CGPoint(x: x, y: y)
    }

    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if progress > 0.0 {
            let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)
            path.addEllipse(in: frame)
        }

        return path
    }
}
