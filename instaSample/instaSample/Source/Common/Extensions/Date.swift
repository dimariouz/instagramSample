//
//  Data.swift
//  instaSample
//
//  Created by mac on 22.02.2021.
//

import UIKit

extension String {
    func toDate(withFormat format: String = "dd.MM.yyyy HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() }
        return date
    }
}

extension Date {
    func toString(withFormat format: String = "dd.MM.yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        return str
    }
}
