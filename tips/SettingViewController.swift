//
//  SettingViewController.swift
//  tips
//
//  Created by minh on 11/4/15.
//  Copyright © 2015 minh. All rights reserved.
//

import UIKit


protocol SettingDelegate {
    func updateData(data: String)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var defaultPercent: UISegmentedControl!
    @IBOutlet weak var defaultStyle: UISwitch!
    @IBOutlet weak var backButton: UIButton!
    var delegate: SettingDelegate?

    func closeModal(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        
        self.delegate?.updateData("")
//        let viewController = sender.sourceViewController as? ViewController
//        viewController!.loadUserSetting()
    }
    
    @IBAction func backToHomePage(sender: AnyObject) {
        closeModal(sender)
    }
    
    @IBAction func swipeToHomePage(sender: AnyObject) {
        closeModal(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultPercent.selectedSegmentIndex = UserSettings.defaultTipPercentIndex
        defaultStyle.on = UserSettings.darkStyle
    }
    
    @IBAction func changePercent(sender: AnyObject) {
        UserSettings.defaultTipPercentIndex = defaultPercent.selectedSegmentIndex
    }
    
    @IBAction func changeStyle(sender: AnyObject) {
        UserSettings.darkStyle = defaultStyle.on
    }
    
    
}
