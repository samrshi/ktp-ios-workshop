//
//  ContentView.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import SwiftUI

struct ContentView: View {
    let goals: [Goal] = [.move, .exercise, .stand]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                <#Text("Hello, world!")#>
            }
            .navigationTitle("Summary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
