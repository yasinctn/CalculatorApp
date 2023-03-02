//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Yasin Cetin on 2.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    private var isFinishTyping = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButtonsTapped(_ sender: UIButton) {
        
        if let currentButton = sender.currentTitle{
            if isFinishTyping{
                display.text = currentButton
                isFinishTyping = false
            }else{
                
                if currentButton == "."{
                    guard let currentValue = Double(display.text!) else{
                        fatalError("cannot convert")
                    }
                    
                    let isInt = floor(currentValue) == currentValue
                    if !isInt{
                        return
                    }
                }
                display.text? += currentButton
            }
        }
    }
    
    private var calculator = calculatorLogic()
    
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        isFinishTyping = true
        
        guard let number = Double(display.text!)else{
            fatalError("error")
        }
        
        calculator.setNum(number)
        
        
        
        if let calcMetod = sender.currentTitle{
            
            
            if let result = calculator.calculate(calcMetod) {
                display.text = String(result)
            }
            
        }
        
        
        
        
    }
}

