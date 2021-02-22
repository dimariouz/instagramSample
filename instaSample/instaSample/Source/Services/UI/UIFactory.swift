//
//  UIFactory.swift
//  instaSample
//
//  Created by mac on 20.02.2021.
//

import UIKit

struct UIFactory {
    
    struct Views {
        
        static func view(backgroundColor: UIColor = .white) -> UIView {
            let view = UIView()
            view.backgroundColor = backgroundColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
        static func imageView(image: UIImage? = UIImage(),
                              contentMode: UIView.ContentMode = .scaleAspectFit,
                              backgroundColor: UIColor = .clear) -> UIImageView {
            let view = UIImageView()
            view.contentMode = contentMode
            view.image = image
            view.backgroundColor = backgroundColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
        static func label(text: String = "",
                          textColor: UIColor = .black,
                          backgroundColor: UIColor = .clear,
                          textAlignment: NSTextAlignment = .center,
                          adjustsFontSizeToFitWidth: Bool = true,
                          font: UIFont = .systemFont(ofSize: 15),
                          numberOfLines: Int = 1) -> UILabel {
            let view = UILabel()
            view.text = text
            view.textColor = textColor
            view.backgroundColor = backgroundColor
            view.textAlignment = textAlignment
            view.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
            view.font = font
            view.minimumScaleFactor = 0.5
            view.numberOfLines = numberOfLines
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
        static func button(title: String = "Button",
                           backgroundColor: UIColor = .white) -> UIButton {
            let view = UIButton()
            view.backgroundColor = backgroundColor
            view.setTitle(title, for: .normal)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
        static func imageButton(image: UIImage? = UIImage())-> UIButton {
            let view = UIButton()
            view.setImage(image, for: .normal)
            view.imageView?.contentMode = .scaleAspectFit
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
        static func activityView(style: UIActivityIndicatorView.Style = .medium) -> UIActivityIndicatorView {
            let view = UIActivityIndicatorView()
            view.style = style
            view.hidesWhenStopped = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
    }
    
    struct TableView {
        static func tableView() -> UITableView {
            let view = UITableView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.register(cells: [PostTableViewCell.self])
            view.showsVerticalScrollIndicator = false
            view.separatorStyle = .none
            view.tableFooterView = UIView()
            view.backgroundColor = .clear
            return view
        }
    }
}
