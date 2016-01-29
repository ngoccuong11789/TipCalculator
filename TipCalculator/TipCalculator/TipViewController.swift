//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rea Won Kim on 1/26/16.
//  Copyright © 2016 Rea Won Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {

    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var UIViewControl: UIView!

    @IBOutlet weak var lblTotalView: UILabel!
    @IBOutlet weak var lblTipAmount: UILabel!
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var lblTip: UILabel!
    var tipAmount : Int!
    var defaults : NSUserDefaults!
    var valueSaved : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults()
        lblTip.text = "$0.00"
        lblTotal.text = "$0.00"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func userDidEnterInformation(info: Int) {
        tipControl.selectedSegmentIndex = info
        self.count()

    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func count(){
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: txtBillAmount.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        lblTip.text = String(format: "$%.2f", tip)
        lblTotal.text = String(format: "$%.2f", total)

    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        self.count()
        /*UIView.animateWithDuration(0.5, animations: {
        self.lblTip.center.x += self.view.bounds.width
        })*/
        
    }
    override func viewWillDisappear(animated: Bool) {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tip")
        defaults.setInteger(Int(txtBillAmount.text!)!, forKey: "saveBill")
        defaults.synchronize()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        lblTip.center.x -= view.bounds.width
        lblTipAmount.center.x -= view.bounds.width
        UIViewControl.center.x -= view.bounds.width
        lblTotalView.center.x -= view.bounds.width
        lblTotal.center.x -= view.bounds.width
        tipControl.center.x -= view.bounds.width
    }
    override func viewDidAppear(animated: Bool) {
        valueSaved = defaults.integerForKey("saveBill")
        txtBillAmount.text = String(valueSaved)
    }

    @IBAction func txtClick(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self.lblTip.hidden = false
            self.lblTip.center.x += self.view.bounds.width
            self.lblTipAmount.hidden = false
            self.lblTipAmount.center.x += self.view.bounds.width
            self.UIViewControl.hidden = false
            self.UIViewControl.center.x += self.view.bounds.width
            self.lblTotalView.hidden = false
            self.lblTotalView.center.x += self.view.bounds.width
            self.lblTotal.hidden = false
            self.lblTotal.center.x += self.view.bounds.width
            self.tipControl.hidden = false
            self.tipControl.center.x -= self.view.bounds.width
        })
        self.count()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC"{
            let SettingVC: SettingsViewController = segue.destinationViewController as! SettingsViewController
            SettingVC.delegate = self
        }
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

