//
//  HomeView.swift
//  instaSample
//
//  Created by mac on 20.02.2021.
//

import UIKit

final class HomeView: RootController {
    
    private var tableView = UIFactory.TableView.tableView()
    private let model = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        setupTableView()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPostList()
    }
    
    private func setupTableView() {
        view.add(subviews: tableView)
        tableView.fillSuperview()
        tableView.register(cells: [PostTableViewCell.self])
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getPostList() {
        model.getPostList()
    }
    
    
    private func setupViewModel() {
        model.didReceiveResult = { [weak self] _ in
            self?.tableView.reloadData()
        }
        model.didReceiveError = { _ in
            //handle error
        }
    }

}

extension HomeView: UITableViewDelegate {}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cellClass: PostTableViewCell.self) else { return UITableViewCell () }
        let post = model.posts[indexPath.row]
        cell.configureCell(model: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
