//
//  ViewController.swift
//  EggTimer
//
//  Created by Hani on 7/8/2023.
//

import UIKit
import AVFoundation

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

 //MARK: - UIKit elements

  let selectedEggTitle: UILabel = UILabel()
  let eggsStackView: UIStackView = UIStackView()
  let firstLineStackView: UIStackView = UIStackView()
  let secondLineStackView: UIStackView = UIStackView()

  let softEggButton: UIButton = UIButton()
  let mediumEggButton: UIButton = UIButton()
  let hardEggButton: UIButton = UIButton()
  let overEggButton: UIButton = UIButton()
  var allEggs = [UIButton]()

  let timeProgressBar: UIProgressView = UIProgressView(progressViewStyle: .bar)
  var audioPlayer: AVPlayer?
  var timer: Timer = Timer()
  var selectedEgg: Egg = Egg(title: Constants.defaultTitle, time: 100)
  var currentProgress: Double = 0
  var remainingTime: Double = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    layout()
  }

  @objc func buttonSelected(_ sender: UIButton!) {

    switch sender {
      case softEggButton:
        selectedEgg = Constants.softEggTitle
      case mediumEggButton:
        selectedEgg = Constants.mediumEggTitle
      case hardEggButton:
        selectedEgg = Constants.hardEggTitle
      case overEggButton:
        selectedEgg = Constants.overEggTitle
      default:
        print("Error: wrong button")
    }

    timeProgressBar.isHidden = false
    timer.invalidate()
    timeProgressBar.progress = 0
    currentProgress = 0
    focusOnTheSelectedEgg(sender)
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timesUp), userInfo: nil, repeats: true)
  }

  @objc func timesUp() {

    if currentProgress != selectedEgg.time {
      currentProgress += 1
      remainingTime = selectedEgg.time - currentProgress
      remainingTime == 10 ? playSound() : nil
      timeProgressBar.setProgress(Float( currentProgress / selectedEgg.time), animated: true)
      selectedEggTitle.text = "\(selectedEgg.title)\n will be ready in \(Int(remainingTime))s"

    }else{
      currentProgress = 0
      timer.invalidate()
      timeProgressBar.isHidden = true
      selectedEggTitle.text = "\(selectedEgg.title) is ready"
    }
  }

  func focusOnTheSelectedEgg(_ sender: UIButton!) {
    for egg in allEggs {
      if sender != egg {
        egg.layer.opacity = 0.5
        egg.sizeThatFits(CGSize(width: 30, height: 30))
      } else {
        egg.layer.opacity = 1
      }
    }
  }

  func playSound() {
    let audioSource = Bundle.main.url(forResource: "sound", withExtension: "mp3")
    if let sound = audioSource {
      audioPlayer = .init(url: sound)
      if let isAudio = audioPlayer {
        isAudio.play()
      }
    }
  }


//MARK: - Private
  private func setup() {

    view.backgroundColor = Constants.Colors.background
    view.addSubview(selectedEggTitle)
    view.addSubview(eggsStackView)
    view.addSubview(timeProgressBar)

    selectedEggTitle.text = selectedEgg.title
    selectedEggTitle.textColor = UIColor(named: "secondColor")
    selectedEggTitle.numberOfLines = 2
    selectedEggTitle.textAlignment = .center
    selectedEggTitle.font = .systemFont(ofSize: 30,weight: .medium)
    selectedEggTitle.translatesAutoresizingMaskIntoConstraints = false

    eggsStackView.initStackView(axis: .vertical)
    eggsStackView.addArrangedSubview(firstLineStackView)
    eggsStackView.addArrangedSubview(secondLineStackView)
    eggsStackView.distribution = .fillEqually
    eggsStackView.spacing = Constants.Styles.spacingBetweenButtons

    setupHorizontalStackView(firstLineStackView, arrangedSubViews: [softEggButton,mediumEggButton])
    setupHorizontalStackView(secondLineStackView, arrangedSubViews: [hardEggButton, overEggButton])


    softEggButton.initUIButton(self, named:"soft_egg", action: #selector(buttonSelected))
    mediumEggButton.initUIButton(self, named: "medium_egg", action: #selector(buttonSelected))
    hardEggButton.initUIButton(self, named: "hard_egg", action: #selector(buttonSelected))
    overEggButton.initUIButton(self, named: "over_egg", action: #selector(buttonSelected))

    allEggs.append(softEggButton)
    allEggs.append(mediumEggButton)
    allEggs.append(hardEggButton)
    allEggs.append(overEggButton)

    timeProgressBar.translatesAutoresizingMaskIntoConstraints = false
    timeProgressBar.setProgress(0, animated: true)
    timeProgressBar.trackTintColor = UIColor(named: "secondColor")
    timeProgressBar.tintColor = .systemYellow
    timeProgressBar.transform = CGAffineTransformMakeScale(1, 3)
    timeProgressBar.isHidden = true

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
      selectedEggTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),

      timeProgressBar.topAnchor.constraint(equalTo: eggsStackView.bottomAnchor, constant: 100),
      timeProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      timeProgressBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])

  }
}

