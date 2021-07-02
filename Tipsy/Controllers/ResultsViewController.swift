//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by André Yamasaki on 02/07/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total = "0.0"
    var tip = 0.10
    var split = 2
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(total)
        settingsLabel.text = "Split between \(split) people, with \(100 * tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
