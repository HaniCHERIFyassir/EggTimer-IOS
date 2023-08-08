//
//  ViewController.swift
//  EggTimer
//
//  Created by Hani on 7/8/2023.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Constants

  private enum Constants {

    enum Colors {
      static let background = UIColor(named: "AccentColor")
    }

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Constants.Colors.background
    // Do any additional setup after loading the view.
  }

//MARK: - Private
  private func setup() {

  }
}

