//
//  UIButton+Extention.swift
//  EggTimer
//
//  Created by Hani on 8/8/2023.
//

import UIKit

extension UIButton {

  func initUIButton(_ target: Any?,named: String,action: Selector) {
    self.backgroundColor = .clear
    self.setImage(UIImage(named: named), for: .normal)
    self.imageView?.contentMode = .scaleAspectFit
    self.addTarget(target, action: action, for: .touchUpInside)
  }

}
