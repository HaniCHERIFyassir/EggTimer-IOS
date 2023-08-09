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
  init(title: String, time: Double) {
    self.title = title
    self.time = time * 60
  }
  func calculateTime() -> Double {
    return time * 60
  }

}
