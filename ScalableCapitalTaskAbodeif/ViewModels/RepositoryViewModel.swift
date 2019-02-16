//
//  RepositoryViewModel.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

class RepositoryViewModel {
    
    var isDataTaskInProgress: Bool = false
    var repository: RepositoryModel?
    
    
    func fetchCommitTest(completition: @escaping ((_ callSucceeded: Bool, _ result: CommitModel?)->())) {
        let repoName = self.repository?.name ?? "noName"
        let url = API.getRepoCommitsPrefix + repoName + "/commits"
        print("Should fetch commits with url: \(url)")
        NetworkManager.shared().loadCommits(url: url) { (isSuccess, response) in
            if isSuccess {
                let commit = response?[0]
                completition(true, commit)
            }
            else {
                completition(false, nil)
            }
        }
    }
    
}
