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
    @IBOutlet weak var lblx1: UILabel!
    @IBOutlet weak var lblx2: UILabel!
    @IBOutlet weak var lblx3: UILabel!
    @IBOutlet weak var lblx4: UILabel!
    @IBOutlet weak var discountImage1: UIImageView!
    @IBOutlet weak var discountImage2: UIImageView!
    @IBOutlet weak var discountImage3: UIImageView!
    @IBOutlet weak var discountImage4: UIImageView!
    @IBOutlet weak var discountImage5: UIImageView!
    @IBOutlet weak var discountImage6: UIImageView!
    @IBOutlet weak var discountImage7: UIImageView!
    @IBOutlet weak var discountImage8: UIImageView!
    @IBOutlet weak var discountImage9: UIImageView!
    @IBOutlet weak var discountImage10: UIImageView!
    
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
        lblx1.text = String(format: "$%.2f", total)
        lblx2.text = String(format: "$%.2f", total/2)
        lblx3.text = String(format: "$%.2f", total/3)
        lblx4.text = String(format: "$%.2f", total/4)
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
        discountImage1.center.x -= view.bounds.width
        discountImage2.center.x -= view.bounds.width
        discountImage3.center.x -= view.bounds.width
        discountImage4.center.x -= view.bounds.width
        discountImage5.center.x -= view.bounds.width
        discountImage6.center.x -= view.bounds.width
        discountImage7.center.x -= view.bounds.width
        discountImage8.center.x -= view.bounds.width
        discountImage9.center.x -= view.bounds.width
        discountImage10.center.x -= view.bounds.width
        lblx1.center.x -= view.bounds.width
        lblx2.center.x -= view.bounds.width
        lblx3.center.x -= view.bounds.width
        lblx4.center.x -= view.bounds.width
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
            self.discountImage1.hidden = false
            self.discountImage1.center.x += self.view.bounds.width
            self.discountImage2.hidden = false
            self.discountImage2.center.x += self.view.bounds.width
            self.discountImage3.hidden = false
            self.discountImage3.center.x += self.view.bounds.width
            self.discountImage4.hidden = false
            self.discountImage4.center.x += self.view.bounds.width
            self.discountImage5.hidden = false
            self.discountImage5.center.x += self.view.bounds.width
            self.discountImage6.hidden = false
            self.discountImage6.center.x += self.view.bounds.width
            self.discountImage7.hidden = false
            self.discountImage7.center.x += self.view.bounds.width
            self.discountImage8.hidden = false
            self.discountImage8.center.x += self.view.bounds.width
            self.discountImage9.hidden = false
            self.discountImage9.center.x += self.view.bounds.width
            self.discountImage10.hidden = false
            self.discountImage10.center.x += self.view.bounds.width
            self.lblx1.hidden = false
            self.lblx1.center.x += self.view.bounds.width
            self.lblx2.hidden = false
            self.lblx2.center.x += self.view.bounds.width
            self.lblx3.hidden = false
            self.lblx3.center.x += self.view.bounds.width
            self.lblx4.hidden = false
            self.lblx4.center.x += self.view.bounds.width
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

