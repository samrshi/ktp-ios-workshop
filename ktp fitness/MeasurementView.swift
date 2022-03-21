//
//  MeasurementView.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/21/22.
//

import SwiftUI

struct MeasurementView: View {
    let name: String
    let value: String
    let unit: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(name)
                .font(.subheadline)
                .lineLimit(1)

            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(color)
            + Text(unit)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(color)
        }
    }
}
