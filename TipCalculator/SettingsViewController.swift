//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Rea Won Kim on 1/26/16.
//  Copyright © 2016 Rea Won Kim. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate{
    func userDidEnterInformation(info: Int)
}

class SettingsViewController: UIViewController {
    var defaults : NSUserDefaults!
    @IBOutlet weak var tipAmountPercentage: UISegmentedControl!
    @IBOutlet weak var lblDefaultTipAmount: UILabel!
    var delegate: DataEnteredDelegate? = nil
    
    var tipAmount : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults()
        
                // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendKeySegmentControl(sender: AnyObject) {
        
    
    }
    override func viewWillDisappear(animated: Bool) {
        if (delegate != nil){
            let index: Int = tipAmountPercentage.selectedSegmentIndex
            delegate!.userDidEnterInformation(index)
            self.navigationController?.popViewControllerAnimated(true)
        }

    }
    override func viewWillAppear(animated: Bool) {
        tipAmountPercentage.selectedSegmentIndex = defaults.integerForKey("tip")
        
        //tipAmountPercentage.center.x -= view.bounds.width
        
        tipAmountPercentage.center.x -= view.bounds.width
        lblDefaultTipAmount.center.x -= view.bounds.width
        
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, animations: {
            self.lblDefaultTipAmount.hidden = false
            self.lblDefaultTipAmount.center.x += self.view.bounds.width
        })
        UIView.animateWithDuration(1, animations: {
            self.tipAmountPercentage.hidden = false
            self.tipAmountPercentage.center.x += self.view.bounds.width
        })
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
