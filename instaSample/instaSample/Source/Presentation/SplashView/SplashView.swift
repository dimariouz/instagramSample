//
//  SplashView.swift
//  instaSample
//
//  Created by mac on 18.02.2021.
//

import UIKit

final class SplashView: RootController {
    
    private let titleLabel = UIFactory.Views.label(text: "Instagram Sample App", font: .systemFont(ofSize: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        showTabbar()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        view.add(subviews: titleLabel)
        titleLabel.makeConstraints { make in
            make.center.equalTo(self.view)
            make.left.equalTo(self.view.snp.left).offset(20)
            make.right.equalTo(self.view.snp.right).offset(-20)
        }
    }
    
    private func showTabbar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.push(to: TabBarController())
        }
    }

}
