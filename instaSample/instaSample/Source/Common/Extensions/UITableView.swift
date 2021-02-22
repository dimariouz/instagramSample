//
//  UITableView.swift
//  instaSample
//
//  Created by mac on 20.02.2021.
//

import UIKit

extension UITableView {
    
    func register(cells: [UITableViewCell.Type]) {
        for cell in cells {
            self.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
        }
    }
    
    func dequeue<T: UITableViewCell>(cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T
    }
    
}
