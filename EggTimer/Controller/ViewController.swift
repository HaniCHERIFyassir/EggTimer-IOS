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

    static let softEggTitle: Egg  = Egg(title: "Soft Egg", time: 6)
    static let mediumEggTitle: Egg  = Egg(title: "medium Egg", time: 8)
    static let hardEggTitle: Egg  = Egg(title: "hard Egg", time: 10)
    static let overEggTitle: Egg  = Egg(title: "over Egg", time: 15)
    static let defaultTitle: String = "Select Egg Result"

    enum Colors {
      static let background = UIColor(named: "AccentColor")
    }

    enum Styles {
      static let spacingBetweenButtons: Double = 30
    }

  }

  let selectedEggTitle: UILabel = UILabel()

  let eggsStackView: UIStackView = UIStackView()
  let firstLineStackView: UIStackView = UIStackView()
  let secondLineStackView: UIStackView = UIStackView()

  let softEggButton: UIButton = UIButton()
  let mediumEggButton: UIButton = UIButton()
  let hardEggButton: UIButton = UIButton()
  let overEggButton: UIButton = UIButton()


  var selectedEgg: String = Constants.defaultTitle

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    layout()
  }


  }

//MARK: - Private
  private func setup() {

    view.backgroundColor = Constants.Colors.background
    view.addSubview(selectedEggTitle)
    view.addSubview(eggsStackView)
    view.addSubview(timeProgressBar)

    selectedEggTitle.text = selectedEgg
    selectedEggTitle.textColor = .darkText
    selectedEggTitle.font = .systemFont(ofSize: 30,weight: .bold)
    selectedEggTitle.translatesAutoresizingMaskIntoConstraints = false

    eggsStackView.initStackView(axis: .vertical)
    eggsStackView.addArrangedSubview(firstLineStackView)
    eggsStackView.addArrangedSubview(secondLineStackView)
    eggsStackView.distribution = .fillEqually
    eggsStackView.spacing = Constants.Styles.spacingBetweenButtons

    setupHorizontalStackView(firstLineStackView, arrangedSubViews: [softEggButton,mediumEggButton])
    setupHorizontalStackView(secondLineStackView, arrangedSubViews: [hardEggButton, overEggButton])



    timeProgressBar.translatesAutoresizingMaskIntoConstraints = false
    timeProgressBar.setProgress(0.5, animated: false)
    timeProgressBar.trackTintColor = .systemGray6
    timeProgressBar.tintColor = .systemYellow
    timeProgressBar.transform = CGAffineTransformMakeScale(1, 4)

  }

  private func setupHorizontalStackView(_ stackView: UIStackView,arrangedSubViews: [UIButton]) {

    stackView.initStackView(axis: .horizontal)
    stackView.distribution = .fillEqually
    stackView.spacing = Constants.Styles.spacingBetweenButtons
    for arrangedSubView in arrangedSubViews {
      stackView.addArrangedSubview(arrangedSubView)
    }
  }

  private func layout() {

    NSLayoutConstraint.activate([
      eggsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
      eggsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
      eggsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      eggsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      selectedEggTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      selectedEggTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      timeProgressBar.topAnchor.constraint(equalTo: eggsStackView.bottomAnchor, constant: 100),
      timeProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      timeProgressBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])

  }
}

