//
//  Collection+enumerated.swift
//  ktp fitness
//
//  Created by Samuel Shi on 3/20/22.
//

import Foundation

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Element)> {
      return Array(enumerated())
    }
}
