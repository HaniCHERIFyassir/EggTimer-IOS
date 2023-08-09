//
//  UIStackView+Extention.swift
//  EggTimer
//
//  Created by Hani on 8/8/2023.
//

import UIKit

extension UIStackView {

  func initStackView(axis: NSLayoutConstraint.Axis) {
    self.axis = axis
    self.translatesAutoresizingMaskIntoConstraints = false
  }

}
