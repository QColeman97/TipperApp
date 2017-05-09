//
//  ViewController.swift
//  Tippy
//
//  Created by Quinn Coleman on 5/6/17.
//  Copyright © 2017 Quinn Coleman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
  
    @IBAction func calcTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipSlider.value)//* tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let percentage = Int(tipSlider.value * 100)
        
        tipTitleLabel.text = String(format: "Tip (%d%%)", percentage)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    func randomTip()
    {
        let random = arc4random_uniform(200)
        let value = Int(random) - 100
        tipSlider.setValue(Float(value) / 100.0, animated: true)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        randomTip()
        calcTip("Quinn")
    }
}

