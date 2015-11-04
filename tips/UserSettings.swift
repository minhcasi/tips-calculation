//
//  UserSettings.swift
//  tips
//
//  Created by minh on 11/4/15.
//  Copyright © 2015 minh. All rights reserved.
//

import Foundation
import UIKit

class UserSettings {
    static let CONS_TIP_PERCENT = "defaultTipPercentIndex"
    static let CONS_DARK_STYLE = "darkStyle"
    

    static var colorMain = UIColor(red: 151.0/255, green: 187.0/255, blue: 225.0/255, alpha: 1)
    static var colorTip = UIColor(red: 133.0/255, green: 102.0/255, blue: 196.0/255, alpha: 1)
    static var colorTotal = UIColor(red: 201.0/255, green: 152.0/255, blue: 255.0/255, alpha: 1)
    static var colorDark = UIColor.darkGrayColor()
    static var tipPercentages = [0.18, 0.2, 0.22]
    
    static var defaultTipPercentIndex = 0;
    static var darkStyle = false;
    
    static func load() {
        let userData = NSUserDefaults.standardUserDefaults();
        defaultTipPercentIndex = userData.integerForKey(CONS_TIP_PERCENT);
        darkStyle = userData.boolForKey(CONS_DARK_STYLE);
    }
    
    static func save() {
        let userData = NSUserDefaults.standardUserDefaults();
        userData.setInteger(defaultTipPercentIndex, forKey: CONS_TIP_PERCENT);
        userData.setBool(darkStyle, forKey: CONS_DARK_STYLE);
    }
}