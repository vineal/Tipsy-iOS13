//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vineal Viji Varghese on 22/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var splitAmount: String?
    var tipChosen : String?
    var splitBetween : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = splitAmount
        settingsLabel.text = "Split between \(splitBetween ?? "") people, with \(tipChosen ?? "") tip."
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
