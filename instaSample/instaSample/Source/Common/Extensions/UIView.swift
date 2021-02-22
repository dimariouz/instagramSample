//
//  UIView.swift
//  instaSample
//
//  Created by mac on 20.02.2021.
//

import UIKit
import SnapKit

extension UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func makeConstraints(completion: (ConstraintMaker) -> Void) {
        self.snp.makeConstraints(completion)
    }
    
    func fillSuperview() {
        makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func add(subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func roundCorners(radius: CGFloat, maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.clipsToBounds = true
    }
}
