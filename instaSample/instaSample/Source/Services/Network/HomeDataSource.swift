//
//  HomeDataSource.swift
//  instaSample
//
//  Created by mac on 22.02.2021.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}

protocol PostsDataSource: class {
    func getPostList(completion: @escaping (Result<[PostModel], Error>) -> Void)
}

final class PostsDataService: PostsDataSource {
    
    func getPostList(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode([PostModel].self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}
