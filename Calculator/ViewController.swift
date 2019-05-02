//
//  ViewController.swift
//  Calculator
//
//  Created by Nathalie on 2019/4/27.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)! //transform strings into actual numbers
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //mutiply
            {
                label.text = "x";
            }
            else if sender.tag == 14 //subtract
            {
                label.text = "-";
            }
            else if sender.tag == 15 //add
            {
                label.text = "+";
            }
            else if sender.tag == 17 //次方
            {
                label.text = "^";
            }
            else if sender.tag == 18 //percentage
            {
                label.text = String(previousNumber / 100)
                numberOnScreen = Double(label.text!)!
            }
            else if sender.tag == 19 // 00 up
            {
                label.text = String(previousNumber * 100)
                numberOnScreen = Double(label.text!)!
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12 //divide
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 //multiply
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 //substract
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 //add
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 17 //次方
            {
                label.text = String(pow(previousNumber, numberOnScreen))
            }
            
        }
        else if sender.tag == 11 //reset button
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

