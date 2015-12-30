//
//  ViewController.swift
//  tipcalculator
//
//  Created by Aaron Tan on 12/7/15.
//  Copyright © 2015 Aaron Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    billField.becomeFirstResponder()
    }
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    tipLabel.text = "$0.00"
    totalLabel.text = "$0.00"
    
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
    updateTip()
    }
    func updateTip() {
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            tipControl.selectedSegmentIndex = defaultTip
        default:
            tipControl.selectedSegmentIndex = 0
        }
        updateTip()
}
}

