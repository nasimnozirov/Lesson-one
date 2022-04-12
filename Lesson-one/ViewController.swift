//
//  ViewController.swift
//  Lesson-one
//
//  Created by Nasim Nozirov on 12.04.2022.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private let lightsOff: CGFloat = 0.3
    private let lightsOn:CGFloat = 1
    private var currentLight = CurrentLight.red
    
    override func viewDidLoad() {
        startButton.layer.cornerRadius = 10
        
        redView.alpha = lightsOff
        yellowView.alpha = lightsOff
        greenView.alpha = lightsOff
    }
    
    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
    
    @IBAction func toggleColorOnPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenView.alpha = lightsOff
            redView.alpha = lightsOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightsOff
            yellowView.alpha = lightsOn
            currentLight = .green
        case .green:
            greenView.alpha = lightsOn
            yellowView.alpha = lightsOff
            currentLight = .red
        }
    }
}

extension ViewController {
    enum CurrentLight {
        case red, yellow, green
    }
}
