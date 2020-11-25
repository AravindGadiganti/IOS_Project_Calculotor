//
//  ViewController.swift
//  IOS_Final_Project_Calculator
//
//  Created by Aravind Gadiganti on 21/11/20.
//  Copyright © 2020 Aravind Gadiganti. All rights reserved.
//

import UIKit
enum Operations:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
    case Modulo = "%"
    case Invert = "Invert"
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var runningNumber = ""
    var firstValue = ""
    var secondValue = ""
    var result = ""
    var currentOperation:Operations = .Null
    @IBOutlet var resultLabel: UILabel!
    @IBAction func buttonPressed(_ sender: RoundButton) {
        if(runningNumber.count <= 9){
            runningNumber += "\(sender.tag)"
            resultLabel.text = runningNumber
        }
    }
    
    @IBAction func allClear(_ sender: RoundButton) {
        runningNumber = ""
        firstValue = ""
        secondValue = ""
        result = ""
        currentOperation = .Null
        resultLabel.text = "0"
    }
    
    @IBAction func invert(_ sender: RoundButton) {
             result = String(Double(resultLabel.text!)! * -1)
            if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                result = "\(Int(Double(result)!))"
            }
        if result == "0" {
            firstValue = ""
        }
        else{
        firstValue = result
        }
        resultLabel.text = result
    }
    
    @IBAction func modulo(_ sender: RoundButton) {
        operation(operation: .Modulo)
        
    }
    
    @IBAction func divide(_ sender: RoundButton) {
        operation(operation: .Divide)
        
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
        operation(operation: .Multiply)
     
    }
    
    @IBAction func addition(_ sender: RoundButton) {
        operation(operation: .Add)
        
    }
    
    @IBAction func subtraction(_ sender: RoundButton) {
        operation(operation: .Subtract)
        
    }
    
    @IBAction func equals(_ sender: RoundButton) {
        operation(operation: currentOperation)
        currentOperation = .Null
    }
    
    
    @IBAction func dot(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            if !runningNumber.contains("."){
            runningNumber += "."
            }
            resultLabel.text = runningNumber
        }
    }
        
    func operation(operation: Operations){
            if currentOperation != .Null {
                if runningNumber != ""{
                 secondValue = runningNumber
                 runningNumber = ""
                if currentOperation == .Add{
                    if firstValue != "" && secondValue != ""{
                    result = "\(Double(firstValue)! + Double(secondValue)!)"
                    }
                }
                else if currentOperation == .Subtract{
                    if firstValue != "" && secondValue != ""{
                    result = "\(Double(firstValue)! - Double(secondValue)!)"
                    }
                }
                else if currentOperation == .Divide{
                    if firstValue != "" && secondValue != ""{
                     result = "\(Double(firstValue)! / Double(secondValue)!)"
                    }
                }
                else if currentOperation == .Multiply{
                    if firstValue != "" && secondValue != ""{
                     result = "\(Double(firstValue)! * Double(secondValue)!)"
                    }
                }
                else if currentOperation == .Modulo{
                    if firstValue != "" && secondValue != ""{
                     result = "\(Double(firstValue)!.truncatingRemainder(dividingBy: Double(secondValue)!))"
                    }
                }
                    firstValue = result
                    result = "\(Double(round(1000000 * Double(result)!)/1000000))"
                    if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                        result = "\(Int(Double(result)!))"
                    }
                    resultLabel.text =  result
                } }
            else{
                if firstValue == ""{
                firstValue = runningNumber
               }
                runningNumber = ""
            }
        currentOperation = operation
        }
    }
    
    
    
    
    
    


