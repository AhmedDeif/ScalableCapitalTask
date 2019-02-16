//
//  RepositoriesTableViewController.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
import CoreData

class RepositoriesTableViewController: UITableViewController {

    let cellReuseIdentifier = "RepositoryTableViewCell"
    var repositoryViewModels: [RepositoryViewModel] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchPresistantData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 120
        self.tableView.allowsSelection = false
        registerCells()
        fetchDataFromServer()
    }

    
    func registerCells() {
        self.tableView.register(UINib(nibName: cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    
    func fetchPresistantData() {
        let managedContext = NetworkManager.getManagedContext()
        let fetchRequest =
            NSFetchRequest<Repository>(entityName: "Repository")
        do {
            if let repos = try managedContext?.fetch(fetchRequest) {
                for repo in repos {
                    let viewModel = RepositoryViewModel()
                    viewModel.repository = repo
                    self.repositoryViewModels.append(viewModel)
                }
            }
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func fetchDataFromServer() {
        NetworkManager.shared().loadRepos(url: API.getAllRepos) { (isSuccess, response) in
            if isSuccess {
                self.repositoryViewModels.removeAll()
                for repo in response! {
                    let viewModel = RepositoryViewModel()
                    viewModel.repository = repo
                    self.repositoryViewModels.append(viewModel)
                }
                // I need to delete the data already saved as well
                self.saveData()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else {
                print("Failed to fetch repos from network")
            }
        }
    }
    
    func saveData() {
        let viewContext = NetworkManager.getManagedContext()
        do {
            try viewContext?.save()
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
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
        cell.myIndexPath = indexPath
        cell.loadCommits(forViewModel: viewModel, indexPath: indexPath.row)
        return cell
    }

    
}
