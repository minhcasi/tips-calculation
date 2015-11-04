//
//  SettingViewController.swift
//  tips
//
//  Created by minh on 11/4/15.
//  Copyright © 2015 minh. All rights reserved.
//

import UIKit

// protocal to connect to main view
protocol SettingDelegate {
    func callBackToMainView()
}

class SettingViewController: UIViewController {
    @IBOutlet weak var defaultPercent: UISegmentedControl!
    @IBOutlet weak var defaultStyle: UISwitch!
    @IBOutlet weak var backButton: UIButton!
    var delegate: SettingDelegate?

    // close current modal and back to main
    func closeModal(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        // callback to trigger event update the main view
        self.delegate?.callBackToMainView()
    }
    
    // back button event
    @IBAction func backToHomePage(sender: AnyObject) {
        closeModal(sender)
    }
    
    // swipe event to close modal
    @IBAction func swipeToHomePage(sender: AnyObject) {
        closeModal(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load from data setting for view
        defaultPercent.selectedSegmentIndex = UserSettings.defaultTipPercentIndex
        defaultStyle.on = UserSettings.darkStyle
    }
    
    // change tab percent event
    @IBAction func changePercent(sender: AnyObject) {
        UserSettings.defaultTipPercentIndex = defaultPercent.selectedSegmentIndex
    }
    
    // change style option event
    @IBAction func changeStyle(sender: AnyObject) {
        UserSettings.darkStyle = defaultStyle.on
    }
}
