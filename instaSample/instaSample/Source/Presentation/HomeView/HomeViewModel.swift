//
//  HomeViewModel.swift
//  instaSample
//
//  Created by mac on 22.02.2021.
//

import Foundation

final class HomeViewModel {
    
    private let postsDataSource: PostsDataSource
    
    init(dataSource: PostsDataSource = PostsDataService()) {
        self.postsDataSource = dataSource
    }
    
    var didReceiveError: Closure<Error>?
    var didReceiveResult: Closure<Void>?
    
    var posts: [PostModel] = []
    
    func getPostList() {
        postsDataSource.getPostList { result in
            switch result {
            case .success(let data):
                self.posts = data
                self.didReceiveResult?(())
            case .failure(let error):
                self.didReceiveError?(error)
            }
        }
    }
    
}
