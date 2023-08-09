//
//  Egg.swift
//  EggTimer
//
//  Created by Hani on 8/8/2023.
//

import Foundation

struct Egg {
  let title: String
  let time: Double

  func calculateTime() -> Double {
    return time * 60
  }

}
