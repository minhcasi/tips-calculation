//
//  ViewController.swift
//  tips
//
//  Created by minh on 10/31/15.
//  Copyright © 2015 minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var resultsView: UIView!

    @IBOutlet weak var inputsView: UIView!
    
    @IBOutlet weak var tipView: UIView!
    
    @IBOutlet weak var totalView: UIView!
    

    @IBOutlet weak var totalForTwoLabel: UILabel!
    
    @IBOutlet weak var totalForThreeLabel: UILabel!
    
    @IBOutlet weak var totalForFourLabel: UILabel!
    
    @IBOutlet var swipeToSetting: UISwipeGestureRecognizer!
    
    // only accept number key
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
            
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
            let filtered = components.joinWithSeparator("")
            
            return string == filtered
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // init default value
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billTextField.delegate = self
        billTextField.keyboardType = .NumberPad
        billTextField.becomeFirstResponder()
        
        // set default swipe to the modal as left swipe
        swipeToSetting.direction = .Left
        
        updateViewWithAnimation();
        
        loadUserSetting();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        // calculate tips and total money
        let tipPercentage = UserSettings.tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = Double(billTextField.text!)
        if billAmount == nil {
            billAmount = 0;
        }

        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        showTotalLabel(total)
        
        updateViewWithAnimation()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // show total label result
    func showTotalLabel(total : Double) {
        totalLabel.text = String(format: "$%.2f", total)
        
        totalForTwoLabel.text = String(format: "$%.2f", total / 2)
        
        totalForThreeLabel.text = String(format: "$%.2f", total / 3)
        
        totalForFourLabel.text = String(format: "$%.2f", total / 4)
    }
    
    // animate the view
    func updateViewWithAnimation() {
        let billAmount = Double(billTextField.text!)
        if billAmount == 0 || billAmount == nil {
            UIView.animateWithDuration(0.2, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.showInputOnlyView()
                }, completion: nil)
        }
        else {
            UIView.animateWithDuration(0.2, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.showResultsView()
                }, completion: nil)
        }
    }
    
    
    // open modal for setting
    @IBAction func swipeToSettings(sender: AnyObject) {
        performSegueWithIdentifier("performSegue", sender: self)
    }
    
    // show only input view
    func showInputOnlyView() {
        tipView.alpha = 0
        resultsView.alpha = 0
        
        var resultFrame: CGRect = resultsView.frame
        resultFrame.origin.y = 800
        resultsView.frame = resultFrame
        
        
        var inputFrame: CGRect = inputsView.frame
        inputFrame.origin.y = 150
        inputsView.frame = inputFrame
    }
    
    // show full view
    func showResultsView() {
        tipView.alpha = 1
        resultsView.alpha = 1
        
        var resultFrame: CGRect = resultsView.frame
        resultFrame.origin.y = 120
        resultsView.frame = resultFrame
        
        
        var inputFrame: CGRect = inputsView.frame
        inputFrame.origin.y = 39
        inputsView.frame = inputFrame
    }
    
    // init data on frist loading
    func loadUserSetting() {
        tipControl.selectedSegmentIndex = UserSettings.defaultTipPercentIndex
        
        if UserSettings.darkStyle {
            mainView.backgroundColor = UserSettings.colorDark
            tipView.backgroundColor = UserSettings.colorDark
            totalView.backgroundColor = UserSettings.colorDark
        }
        else {
            mainView.backgroundColor = UserSettings.colorMain
            tipView.backgroundColor = UserSettings.colorTip
            totalView.backgroundColor = UserSettings.colorTotal
        }
    }

    // for the call back from setting
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "performSegue" {
            (segue.destinationViewController as! SettingViewController).delegate = self
        }
    }
}


extension ViewController: SettingDelegate {
    func callBackToMainView() {
        self.loadUserSetting()
    }
}
