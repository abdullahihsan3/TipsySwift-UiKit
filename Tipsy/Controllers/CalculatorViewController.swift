//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    var tip: Double = 0.10
    var numberOfPeople: Int = 2
    var dividedBill: Double?
    
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false;
        tenPctButton.isSelected = false;
        twentyPctButton.isSelected = false;
        
        if(sender.currentTitle == "0%"){
            zeroPctButton.isSelected = true;
            tip = 0.0
        }
        else if(sender.currentTitle == "10%"){
            tenPctButton.isSelected = true;
            tip = 0.10
        }
        else if(sender.currentTitle == "20%"){
            twentyPctButton.isSelected = true;
            tip = 0.20
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        let people = Int(sender.value)
        splitNumberLabel.text = String(people)
        numberOfPeople = people
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let text = billTextField.text ?? "No Text"
        print("Tip Is: \(tip)");
        print("Number Of People: \(numberOfPeople)")
        print("Bill Total: \(text)")
        
        let tipToAdd = tip * (Double(text) ?? 0.0)
        let totalBill = Double(text)! + tipToAdd
        let dividedBillCalculated = totalBill / Double(numberOfPeople)
        dividedBill = dividedBillCalculated
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.total = dividedBill!
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tip = tip
        }
    }
    
    override func viewDidLoad() {
     super.viewDidLoad()
     setupToolbar()
     }
    func setupToolbar(){
    //Create a toolbar
    let bar = UIToolbar()
    //Create a done button with an action to trigger our function to dismiss the keyboard
    let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
    //Create a felxible space item so that we can add it around in toolbar to position our done button
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    //Add the created button items in the toobar
    bar.items = [flexSpace, flexSpace, doneBtn]
    bar.sizeToFit()
    //Add the toolbar to our textfield
    billTextField.inputAccessoryView = bar
    }
    @objc func dismissMyKeyboard(){
    view.endEditing(true)
    }
    
  
    }


