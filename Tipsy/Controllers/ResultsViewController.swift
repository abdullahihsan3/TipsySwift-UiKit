//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abdullah Ihsan on 21/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var total: Double = 0.0
    var numberOfPeople:Int = 0
    var tip: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(total)
        settingsLabel.text = "Split Between \(numberOfPeople), with \(tip * 100)% Tip"
        
    }
    

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func onRecalculatePressed(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
 

}
