//
//  RootController.swift
//  instaSample
//
//  Created by mac on 18.02.2021.
//

import UIKit

typealias Closure<T> = (T) -> Void

class RootController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func push(to view: UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }
    

}
