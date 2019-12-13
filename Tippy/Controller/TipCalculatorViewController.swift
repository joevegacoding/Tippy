//
//  ViewController.swift
//  Tippy
//
//  Created by Joseph Bouhanef on 2019-12-12.
//  Copyright © 2019 Joseph Bouhanef. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var amountPerPerson: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalBillAmount: UILabel!
    @IBOutlet weak var tipPercentageAmount: UILabel!
    @IBOutlet weak var tipPercentageAmountSlider: UISlider!
    @IBOutlet weak var splitbetweenPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleStepper: UIStepper!
    
    var tipCalculator = TipCalculator(billAmount: 0, tipPercentage: 0.15)
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.addTarget(self, action: #selector(billAmountTextFieldChanged), for: .editingChanged)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        //Placing the Done buttton on the right side of the toolbar.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        billAmountTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
        updateUI()
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageAmountSlider.value)
        tipCalculator.billAmount = (billAmountTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalBillAmount.text = String(format: "$%.02f", tipCalculator.totalAmount)
        let numberOfPeople = Int(splitbetweenPeopleLabel.text!)
        amountPerPerson.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople!))
        
        
    }
    
    //MARK: -Target  / IBActions
    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageAmount.text = String(format: "%2d%%", Int(tipPercentageAmountSlider.value * 100))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleStepper(_ sender: UIStepper) {
        splitbetweenPeopleLabel.text =  String(Int(sender.value))
        calculateBill()
    }
    
    
    @IBAction func billAmountTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
}


