//
//  ViewController.swift
//  Compound Interest Calc
//
//  Created by Shaan Mirchandani
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitleOUTLET: UILabel!
    @IBOutlet weak var sgmMissingVariableOUTLET: UISegmentedControl!
    @IBOutlet weak var txtField1OUTLET: UITextField!
    @IBOutlet weak var txtField2OUTLET: UITextField!
    @IBOutlet weak var txtField3OUTLET: UITextField!
    @IBOutlet weak var txtField4OUTLET: UITextField!
    @IBOutlet weak var btnCalculateOUTLET: UIButton!
    @IBOutlet weak var lblFinalAnswerOUTLET: UILabel!
    
    var missingVar: String?
    var var1: Double?
    var var2: Double?
    var var3: Double?
    var var4: Double?
    var finalAnswer: Double?
    var units: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func chooseMissingVariableSegmentACTION(_ sender: UISegmentedControl) {
        txtField2OUTLET.placeholder = "Percent interest rate"
        txtField3OUTLET.placeholder = "Times compounded per year"
        switch sgmMissingVariableOUTLET.selectedSegmentIndex{
        case 0:
            missingVar = "Final Amount"
            txtField1OUTLET.placeholder = "Principal amount"
            txtField4OUTLET.placeholder = "Years invested"
        case 1:
            missingVar = "Principal Amount"
            txtField1OUTLET.placeholder = "Final amount"
            txtField4OUTLET.placeholder = "Years invested"

            
        case 2:
            missingVar = "Years Invested"
            txtField1OUTLET.placeholder = "Principal amount"
            txtField4OUTLET.placeholder = "Final amount"
            
        default:
            break
        }
    }
    @IBAction func pressCalculateButtonACTION(_ sender: UIButton) {

        if (assignValuess() == true){
            switch  missingVar! {
            case "Final amount":
                calcFinalAmnt()
            case "Pricipal amount":
                calcPrincipalAmnt()
            case "Years invested":
                calcFinalAmnt()
            default:
                break
            }
            showFinalAnswer(variable: missingVar!)
        }
        
        
    
    }
    
    
    func assignValuess() -> Bool {
        if (!txtField1OUTLET.hasText || !txtField2OUTLET.hasText || !txtField3OUTLET.hasText || !txtField4OUTLET.hasText){
        return false

        } else {
            var1 = Double(txtField1OUTLET.text!)
            var2 = Double(txtField2OUTLET.text!)! / 100
            var3 = Double(txtField3OUTLET.text!)
            var4 = Double(txtField4OUTLET.text!)
            
        }
        return true
    }
    


    func calcFinalAmnt(){
        //p = var1
        // r = var2
        // n = 3
        //t = 4
        finalAnswer = var1! * pow(1 + (var2! / var3!), var3! * var4!)
        units = " dollars"
        
        
    }
    
    func calcPrincipalAmnt(){
        //var1 = a
        //var2 = r
        //var3 = n
        //var4 = t
        
        finalAnswer = var1! / pow(1 + (var2! / var3!), var3! * var4!)
        units = " dollars"
        
        
        
    }
    
    func calcYearsInvstd(){
        //var1 = p
        //var2 = r
        //var3 = n
        //var4 = a
        
            finalAnswer = log(var4! / var1!) / log(1 + (var2! / var3!))
        finalAnswer = finalAnswer! / var3!
        units = " years"
        
    }
    
    func showFinalAnswer(variable: String){
        lblFinalAnswerOUTLET.text = variable + ": " + String(finalAnswer!) + units!
    }


}

