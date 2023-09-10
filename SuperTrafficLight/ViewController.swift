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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 8
        
        redColor.alpha = alphaOff
        yellowColor.alpha = alphaOff
        greenColor.alpha = alphaOff
        
    }
    
    override func viewWillLayoutSubviews() {
        redColor.layer.cornerRadius = calcRadius(redColor)
        yellowColor.layer.cornerRadius = calcRadius(yellowColor)
        greenColor.layer.cornerRadius = calcRadius(greenColor)
       
    }
    
    private func calcRadius(_: UIView) -> CGFloat {
        redColor.frame.width / 2
    }
    
    @IBAction func selectorColor() {
        if buttonView.currentTitle == "START" {
            buttonView.setTitle("NEXT", for: .normal)
        }
        
        if redColor.alpha == alphaOn {
            setColor(red: alphaOff, yellow: alphaOn, green: alphaOff)
        } else if yellowColor.alpha == alphaOn {
            setColor(red: alphaOff, yellow: alphaOff, green: alphaOn)
        } else {
            setColor(red: alphaOn, yellow: alphaOff, green: alphaOff)
        }
        
    }
    
    private func setColor(red: CGFloat, yellow: CGFloat, green: CGFloat) {
        redColor.alpha = red
        yellowColor.alpha = yellow
        greenColor.alpha = green
    }
}

