//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsViewControllerProtocol {
    func plutoPlanetStatusChanged()
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
    
    // 1. Added a new variable that's receiving our messages.
    // Is a protocol, hence, whoever is behind the mask must implement the functions and properties in 'SettingsViewControllerProtocol'
    var delegate: SettingsViewControllerProtocol!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
        // 2. Sending the message.
        delegate.plutoPlanetStatusChanged()
        
        // If we want to notify everyone about this change.
        NotificationCenter.default.post(name: .plutoPlanetStatusChanged, object: sender.isOn)
        
    }
}
