//
//  PostModel.swift
//  instaSample
//
//  Created by mac on 22.02.2021.
//

import Foundation

struct PostModel: Codable {
    let user: User
    let post: Post
}

struct User: Codable {
    let name: String
    let avatar: String
}

struct Post: Codable {
    let location: String
    let media: [String]
    let likes: Likes
    let description: String
    let time: String
    
    var postTime: String {
        return time.toDate().toString(withFormat: "HH:mm")
    }
}

struct Likes: Codable {
    let count: Int
    let likesByUsers: [String]
    
    var likedUsers: String {
        return likesByUsers.joined(separator: ", ")
    }
}
