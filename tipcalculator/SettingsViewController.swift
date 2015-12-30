//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Aaron Tan on 12/7/15.
//  Copyright © 2015 Aaron Tan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var animationImage: UIImageView!
    @IBOutlet weak var defaultControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        animationImage.image = UIImage(named: "tick.jpg")
        
        animationImage.alpha = 0
    
    }
    func fadeInandOut(){
        
        UIView.animateWithDuration(1.0, animations:
            {
                self.animationImage.alpha = 1.0
                
                
            }, completion: {
                (Completed : Bool) -> Void in
                UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.animationImage.alpha = 0
                    
                    
                    }, completion: {
                        (Completed : Bool) -> Void in
                      ()
                        
                })
                
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func animationDefault(sender: AnyObject) {
        self.fadeInandOut()
        
    }
    @IBAction func onChangeDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            defaultControl.selectedSegmentIndex = defaultTip
        default:
            defaultControl.selectedSegmentIndex = 0
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
