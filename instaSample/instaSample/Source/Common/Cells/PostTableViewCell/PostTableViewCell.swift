//
//  PostTableViewCell.swift
//  instaSample
//
//  Created by mac on 20.02.2021.
//

import UIKit
import SnapKit

final class PostTableViewCell: UITableViewCell {
    
    private let userPhotoImageView = UIFactory.Views.imageView(contentMode: .scaleAspectFill)
    private let userNameLabel = UIFactory.Views.label()
    private let postLocationLabel = UIFactory.Views.label()
    private let postPhotoImageView = UIFactory.Views.imageView(image: UIImage(named: "placeholder"), contentMode: .scaleAspectFit)
    private let likeButton = UIFactory.Views.imageButton(image: UIImage(named: "like"))
    private let commentButton = UIFactory.Views.imageButton(image: UIImage(named: "comment"))
    private let sendButton = UIFactory.Views.imageButton(image: UIImage(named: "send"))
    private let saveButton = UIFactory.Views.imageButton(image: UIImage(named: "save"))
    private let likesLabel = UIFactory.Views.label(textAlignment: .left, numberOfLines: 2)
    private let postTextLabel = UIFactory.Views.label(textAlignment: .left, numberOfLines: 0)
    private let timeLabel = UIFactory.Views.label(textAlignment: .left)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhotoImageView.roundCorners(radius: userPhotoImageView.frame.height / 2)
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        postPhotoImageView.clipsToBounds = true
        
        self.add(subviews: userPhotoImageView, userNameLabel, postLocationLabel, postPhotoImageView, likeButton, commentButton, sendButton, saveButton, likesLabel, postTextLabel, timeLabel)
        
        userPhotoImageView.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        userNameLabel.makeConstraints { (make) in
            make.left.equalTo(userPhotoImageView.snp.right).offset(15)
            make.top.equalTo(userPhotoImageView.snp.top)
        }
        
        postLocationLabel.makeConstraints { (make) in
            make.left.equalTo(userPhotoImageView.snp.right).offset(15)
            make.bottom.equalTo(userPhotoImageView.snp.bottom)
            make.top.equalTo(userNameLabel.snp.bottom)
        }
        
        postPhotoImageView.makeConstraints { (make) in
            make.top.equalTo(userPhotoImageView.snp.bottom).offset(15)
            make.left.equalTo(0)
            make.right.equalTo(0)
            
            let image = postPhotoImageView.image ?? UIImage()
            let ratio = image.size.width / image.size.height
            let newHeight = UIScreen.main.bounds.width / ratio
            make.height.equalTo(newHeight)
        }
       
        likeButton.makeConstraints { make in
            make.top.equalTo(postPhotoImageView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        commentButton.makeConstraints { make in
            make.top.equalTo(postPhotoImageView.snp.bottom).offset(10)
            make.left.equalTo(likeButton.snp.right).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        sendButton.makeConstraints { make in
            make.top.equalTo(postPhotoImageView.snp.bottom).offset(10)
            make.left.equalTo(commentButton.snp.right).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        saveButton.makeConstraints { make in
            make.top.equalTo(postPhotoImageView.snp.bottom).offset(10)
            make.right.equalTo(postPhotoImageView.snp.right)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        likesLabel.makeConstraints { make in
            make.top.equalTo(sendButton.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        postTextLabel.makeConstraints { make in
            make.top.equalTo(likesLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        timeLabel.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        timeLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func configureCell(model: PostModel) {
        userPhotoImageView.image = UIImage(named: model.user.avatar)
        userNameLabel.text = model.user.name
        postLocationLabel.text = model.post.location
        likesLabel.text = "Liked by \(model.post.likes.likedUsers), and \(model.post.likes.count) other"
        postTextLabel.text = "\(model.user.name) \(model.post.description)"
        timeLabel.text = model.post.postTime
        postPhotoImageView.image = UIImage(named: model.post.media.first ?? "")
        
        postPhotoImageView.snp.remakeConstraints { _ in }
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
