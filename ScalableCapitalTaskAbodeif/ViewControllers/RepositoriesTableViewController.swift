//
//  RepositoriesTableViewController.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {

    let cellReuseIdentifier = "RepositoryTableViewCell"
    var repositoryViewModels: [RepositoryViewModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
//        fetchData()
        fetchCommitTest()
    }

    
    func registerCells() {
        self.tableView.register(UINib(nibName: cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    
    func fetchData() {
        NetworkManager.shared().loadRepos(url: API.getAllRepos) { (isSuccess, response) in
            if isSuccess {
                self.repositoryViewModels.removeAll()
                for repo in response! {
                    let viewModel = RepositoryViewModel()
                    viewModel.repository = repo
                    self.repositoryViewModels.append(viewModel)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else {
                print("Failed to fetch repos from network")
            }
        }
    }
    
    func fetchCommitTest() {
//        https://api.github.com/repos/mralexgray/ACEView/commits
        NetworkManager.shared().loadCommits(url: "https://api.github.com/repos/mralexgray/ACEView/commits") { (isSuccess, response) in
            if isSuccess {
                let commit = response?[0]
                print(commit)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositoryViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! RepositoryTableViewCell
        let viewModel = self.repositoryViewModels[indexPath.row]
        if viewModel.repository != nil {
            cell.setData(fromModel: viewModel.repository!)
        }
        return cell
    }

    
}
