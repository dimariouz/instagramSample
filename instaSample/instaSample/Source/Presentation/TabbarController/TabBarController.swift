//
//  TabBarController.swift
//  instaSample
//
//  Created by mac on 18.02.2021.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbarController()
    }

    func setupTabbarController() {
        navigationController?.navigationBar.isHidden = true
        
        let home = HomeView()
        home.tabBarItem.image = UIImage(named: "home")
        home.title = "Home"
        viewControllers = [home]
    }
    
}
