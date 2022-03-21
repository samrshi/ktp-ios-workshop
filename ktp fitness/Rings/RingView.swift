//
//  RingView.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct RingView: View {
    @State private var animatedCurrent: Double = 0.0

    let goal: Goal
    let thickness: Double

    var progress: Double {
        return max(animatedCurrent / goal.goal, .leastNonzeroMagnitude)
    }

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let radius = min(width, height) / 2 - (thickness / 2)

            Circle()
                .strokeBorder(
                    goal.colors.first ?? Color.red,
                    style: .init(lineWidth: thickness, lineCap: .round, lineJoin: .round)
                )
                .opacity(0.5)
                .overlay(progressRing)
                .overlay(RingTipView(progress: progress, ringRadius: radius, ringThickness: thickness, color: ringTipColor))
                .overlay(alignment: .top, content: { icon })
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeOut(duration: 1)) {
                    animatedCurrent = goal.current
                }
            }
        }
    }

    var progressRing: some View {
        RingProgressArc(progress: progress, name: goal.name)
            .strokeBorder(
                AngularGradient(colors: goal.colors,
                                center: .center,
                                startAngle: Angle(degrees: 0),
                                endAngle: Angle(degrees: 360 * progress)),
                style: .init(lineWidth: thickness, lineCap: .round, lineJoin: .round)
            )
            .rotationEffect(Angle(degrees: -90))
    }

    var ringTipColor: Color {
        goal.colors.last ?? .clear
    }

    var icon: some View {
        Image(systemName: goal.iconName)
            .resizable()
            .scaledToFit()
            .frame(width: thickness - 5, height: thickness - 5)
            .padding(2.5)
            .foregroundColor(.black)
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(goal: Goal.defaults.first!, thickness: 20)
            .frame(width: 200, height: 200)
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
