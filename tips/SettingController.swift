//
//  SettingController.swift
//  tips
//
//  Created by minh on 11/4/15.
//  Copyright © 2015 minh. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    @IBOutlet weak var swtDarkStype: UISwitch!
    @IBOutlet weak var segTipPercents: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        }
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         }
    
    
}
