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
    @IBOutlet weak var lblTipPercentage: UILabel!
    @IBOutlet weak var imgEmotion: UIImageView!
    @IBOutlet weak var lblEnough: UILabel!
    @IBOutlet weak var imgClickAddToTip: UIImageView!
    @IBOutlet weak var lblTip: UILabel!
    var delegate: DataEnteredDelegate? = nil
    
    var tipAmount : Int!
    var tip = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults()
        lblTipPercentage.text = "\(tip)%"
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
            defaults.setInteger(tip, forKey: "customTip")
            defaults.synchronize()
        }

    }
    override func viewWillAppear(animated: Bool) {
        tipAmountPercentage.selectedSegmentIndex = defaults.integerForKey("tip")
        
        //tipAmountPercentage.center.x -= view.bounds.width
        
        tipAmountPercentage.center.x -= view.bounds.width
        lblDefaultTipAmount.center.x -= view.bounds.width
        imgClickAddToTip.center.x -= view.bounds.width
        lblTip.center.x -= view.bounds.width
        imgEmotion.center.x -= view.bounds.width
        
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, animations: {
            self.lblDefaultTipAmount.hidden = false
            self.lblDefaultTipAmount.center.x += self.view.bounds.width
            self.imgClickAddToTip.hidden = false
            self.imgClickAddToTip.center.x += self.view.bounds.width
            self.lblTip.hidden = false
            self.lblTip.center.x += self.view.bounds.width
        })
        UIView.animateWithDuration(1, animations: {
            self.tipAmountPercentage.hidden = false
            self.tipAmountPercentage.center.x += self.view.bounds.width
            self.imgEmotion.hidden = false
            self.imgEmotion.center.x += self.view.bounds.width
        })
        
    }

    @IBAction func btAdd(sender: AnyObject) {
        tip = tip + 1
        lblTipPercentage.text = "\(tip)%"
        if (tip < 10)
        {
           imgEmotion.image = UIImage(named: "emotion1.jpg")
        }
        else if (tip >= 10 && tip < 20){
            imgEmotion.image = UIImage(named: "emotion2.png")
        }
        else if (tip >= 20 && tip < 30)
        {
            imgEmotion.image = UIImage(named: "emotion3.png")
        }
        else if (tip >= 30 && tip < 40)
        {
            imgEmotion.image = UIImage(named: "emotion4.png")
        }
        else if (tip >= 40 && tip < 50)
        {
            imgEmotion.image = UIImage(named: "emotion5.jpg")
        }
        else if (tip >= 50 && tip < 60)
        {
            imgEmotion.image = UIImage(named: "emotion6.jpg")
        }
        else if tip >= 60
        {
            tip = 59
            lblEnough.text = "60% is enough, THANK YOU"
            lblEnough.hidden = false
        }
    //tipAmountPercentage.insertSegmentWithTitle(String(tip), atIndex: 3, animated: false)
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
