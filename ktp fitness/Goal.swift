//
//  Goal.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct Goal: Identifiable {
    let id = UUID()

    let name: String
    let iconName: String

    var current: Double
    var goal: Double
    let unit: String

    let colors: [Color]

    var textColor: Color {
        colors.last ?? .primary
    }
    
    var ratioString: String {
        let current = Int(current)
        let goal = Int(goal)
        return "\(current)/\(goal)"
    }
}

extension Goal {
    static var move: Goal {
        Goal(name: "Move", iconName: "arrow.right", current: 370, goal: 360, unit: "CAL", colors: [.ringRedDark, .ringRedLight])
    }

    static var exercise: Goal {
        Goal(name: "Exercise", iconName: "chevron.right.2", current: 75, goal: 30, unit: "MIN", colors: [.ringGreenDark, .ringGreenLight])
    }

    static var stand: Goal {
        Goal(name: "Stand", iconName: "arrow.up", current: 8, goal: 12, unit: "HRS", colors: [.ringBlueDark, .ringBlueLight])
    }

    static var defaults: [Goal] {
        [move, exercise, stand]
    }
}
