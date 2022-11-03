//
//  ViewController.swift
//  Calculator
//
//  Created by Farhan Salam on 31/10/2022.
//

import UIKit

class ViewController: UIViewController {

    var currentOperation: Operator = Operator.nothing
    var calcState : CalculationState = CalculationState.enteringNum
    var firstValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //button action
    
    @IBAction func numberClicked(_ sender: UIButton){
        updateDisplay(number:String (sender.tag))
    }
    
    func updateDisplay (number: String){
        if calcState == CalculationState.newNumStarted{
            if let num =  resultLabel.text{
                if num != ""{
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton){
        
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text{
            if num != ""{
                firstValue = num
                resultLabel.text = ""
            }
        }
        switch sender.tag {
        case 10 :
            currentOperation = Operator.add
        case 11 :
            currentOperation = Operator.subtract
        case 12 :
            currentOperation = Operator.divide
        case 13 :
            currentOperation = Operator.times
        default:
            return
            
        }
    }
    
    @IBAction func equalsClicked(_sender: UIButton){
        calculateSum()
        
    }
    
    func calculateSum(){
        if (firstValue.isEmpty){
            return
        }
        var result = ""
        
        if currentOperation == Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }



}

