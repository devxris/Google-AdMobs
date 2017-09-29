//
//  AppDelegate.swift
//  Google AdMobs
//
//  Created by Chris Huang on 29/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		GADMobileAds.configure(withApplicationID: "ca-app-pub-9021945860330642~3250347786")
		
		return true
	}

}
