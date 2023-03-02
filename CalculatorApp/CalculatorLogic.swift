//
//  CalculatorLogic.swift
//  CalculatorApp
//
//  Created by Yasin Cetin on 2.03.2023.
//

import Foundation

struct calculatorLogic {
    
    private var number :Double?
    private var intermediateCalculation : (n1: Double, calcMetod: String)?
    
    mutating func setNum(_ number: Double){
        self.number = number
    }
    
    func twoNumCalculation(_ num2:Double) ->Double?{
        if let num1 = intermediateCalculation?.n1 ,
           let metod = intermediateCalculation?.calcMetod{
            
            switch metod {
            case "+" :return num1 + num2
            case "-" : return num1 - num2
            case "÷" :return num1 / num2
            case "×" :return num1 * num2
            default:
                fatalError("the operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
    
    mutating func calculate(_ symbol:String) -> Double?{
        
        if let n = number{
            switch symbol{
            case "+/-":return n * -1
            case "AC": return 0
            case"%":return n/100
            case"=": return twoNumCalculation(n)
            default:
                intermediateCalculation = (n1:n , calcMetod: symbol)
            }
        }
        return nil
    }
}
