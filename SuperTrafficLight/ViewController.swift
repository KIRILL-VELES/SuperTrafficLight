//
//  ViewController.swift
//  SuperTrafficLight
//
//  Created by Кирилл Велес on 10.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redColor: UIView!
    @IBOutlet var yellowColor: UIView!
    @IBOutlet var greenColor: UIView!

    @IBOutlet var buttonView: UIButton!

    private let alphaOn: CGFloat = 1
    private let alphaOff: CGFloat = 0.3

    private enum LightState {
        case red, yellow, green, off
    }

    private var state: LightState = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 8
        updateUI()
    }
    
    override func viewWillLayoutSubviews() {
        redColor.layer.cornerRadius = calcRadius(redColor)
        yellowColor.layer.cornerRadius = calcRadius(yellowColor)
        greenColor.layer.cornerRadius = calcRadius(greenColor)
    }

    private func calcRadius(_ view: UIView) -> CGFloat {
        view.frame.width / 2
    }
    
    @IBAction func selectorColor() {
        if buttonView.currentTitle == "START" {
            buttonView.setTitle("NEXT", for: .normal)
        }

        switch state {
        case .red:
            state = .yellow
        case .yellow:
            state = .green
        case .green:
            state = .red
        case .off:
            state = .red
        }

        updateUI()

//        switch (redColor.alpha, yellowColor.alpha, greenColor.alpha) {
//        case (alphaOn, _, _):
//            setColor(red: alphaOff, yellow: alphaOn, green: alphaOff)
//        case (_, alphaOn, _):
//            setColor(red: alphaOff, yellow: alphaOff, green: alphaOn)
//        default:
//            setColor(red: alphaOn, yellow: alphaOff, green: alphaOff)
//        }
        
    }

    private func updateUI() {
        switch state {
        case .red:
            setColor(red: alphaOn, yellow: alphaOff, green: alphaOff)
        case .yellow:
            setColor(red: alphaOff, yellow: alphaOn, green: alphaOff)
        case .green:
            setColor(red: alphaOff, yellow: alphaOff, green: alphaOn)
        case .off:
            setColor(red: alphaOff, yellow: alphaOff, green: alphaOff)
        }
    }

    private func setColor(red: CGFloat, yellow: CGFloat, green: CGFloat) {
        redColor.alpha = red
        yellowColor.alpha = yellow
        greenColor.alpha = green
    }
}

