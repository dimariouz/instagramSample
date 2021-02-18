//
//  AppDelegate.swift
//  instaSample
//
//  Created by mac on 18.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupRootViewController()

        return true
    }
    
    private func setupRootViewController() {
        let view = SplashView()
        self.window?.rootViewController = UINavigationController(rootViewController: view)
        self.window?.makeKeyAndVisible()
    }
}

