//
//  ViewController.swift
//  My Calculator
//
//  Created by Amanda Wei on 12/18/16.
//  Copyright © 2016 Amanda Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userInputedFirstNum = false
    var dotHasinputed = false
    var hasSetoperation = false
    var firstNum:Double = 0
    var secondNum:Double = 0
    var result:Double = 0
    var operationMark:String = ""
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBAction func trillionButton(_ sender: UIButton) {
        if hasSetoperation{
            secondNum = secondNum * 1000000000000
        }else{
            firstNum = firstNum * 1000000000000
        }
    }
    
    
    
    @IBAction func hundredthousandButton(_ sender: UIButton) {
        var unit:Double = 0
        
        switch sender.tag{
        case 5 : unit = 1000000000000
        case 4 : unit = 1000000000
        case 3 : unit = 1000000
        case 2 : unit = 100000
        case 1 : unit = 10000
        default:
            break
        }
        
        if hasSetoperation{
            secondNum = Double(inputLabel.text!)!
            secondNum = secondNum * unit
            inputLabel.text = String(secondNum)
        }else{
            firstNum = Double(inputLabel.text!)!
            firstNum = firstNum * unit
            inputLabel.text = String(firstNum)
        }
    }

    
    
    @IBAction func inputDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInputedFirstNum{
        inputLabel.text = inputLabel.text! + digit
        }else{
        inputLabel.text = digit
            userInputedFirstNum = true
        }
    }
    
    
    @IBAction func addDot(_ sender: UIButton) {
        if dotHasinputed == false{
            if userInputedFirstNum == false {
                inputLabel.text = "0."
                dotHasinputed = true
                userInputedFirstNum = true
            }else{
            inputLabel.text = inputLabel.text! + "."
            dotHasinputed = true
        }
        }
    }

    
    @IBAction func clearCurrentnum(_ sender: UIButton) {
        inputLabel.text = "0"
        userInputedFirstNum = false
        dotHasinputed = false
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        userInputedFirstNum = false
        dotHasinputed = false
        hasSetoperation = false
        firstNum = 0
        secondNum = 0
        result = 0
        operationMark = ""
        inputLabel.text = "0"
        resultLable.text = ""
    }
    
    
    @IBAction func addPercentage(_ sender: UIButton) {
        if hasSetoperation == false {
            firstNum = Double(inputLabel.text!)!*0.01
            inputLabel.text = String(firstNum)
        }else{
            secondNum = Double(inputLabel.text!)!*0.01
            inputLabel.text = String(secondNum)
        }
    }
    

    @IBAction func setOperation(_ sender: UIButton) {
        if hasSetoperation == false{
            firstNum = Double(inputLabel.text!)!
            operationMark = sender.currentTitle!
            hasSetoperation = true
            inputLabel.text = operationMark
            resultLable.text = String(firstNum) + operationMark
            userInputedFirstNum = false
            dotHasinputed = false
        }else{
            operationMark = sender.currentTitle!
            resultLable.text = String(firstNum) + operationMark
        }
    }

    
    @IBAction func getResult(_ sender: UIButton) {
        if hasSetoperation == true {
            
            secondNum = Double(inputLabel.text!)!
            
            switch operationMark {
            case "+": result = firstNum + secondNum
            case "-": result = firstNum - secondNum
            case "×": result = firstNum * secondNum
            case "÷": result = firstNum / secondNum
            default:
                break
            }
            resultLable.text = String(firstNum) + operationMark + inputLabel.text! + "="
            inputLabel.text = String(result)
            
//operate clearAll
            userInputedFirstNum = false
            dotHasinputed = false
            hasSetoperation = false
            firstNum = 0
            secondNum = 0
            result = 0
            operationMark = ""

            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

