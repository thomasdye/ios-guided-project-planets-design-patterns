//
//  AppDelegate.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(respondsToNotificationsFromPlutoStatusChanged),
                                               name: .plutoPlanetStatusChanged,
                                               object: nil) // if nil, listen from all broadcasters
        
        return true
    }
    
    @objc func respondsToNotificationsFromPlutoStatusChanged() {
        print("Status Changed")
    }
    
    // 1. Prepare the app delegate for restoring state.
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    // 2. Prepare the app for saving UI state.
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }

}

