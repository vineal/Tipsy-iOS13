//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var billBrain = BillingBrain()
    var bill = Bill()

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        bill.percentString = sender.currentTitle ?? "10%"
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        bill.personSplit = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill.enteredAmount = billTextField.text!
        bill = billBrain.calculateBill(billObj: bill)
    }
    // MARK: - Result View Controller Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue"{
            if let viewController = segue.destination as? ResultsViewController {
                viewController.splitAmount = bill.splitValue
                viewController.tipChosen = bill.percentString
                viewController.splitBetween = String(bill.personSplit)
            }
            
        }
    }
    
}

