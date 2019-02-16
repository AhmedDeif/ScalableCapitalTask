//
//  RepositoryTableViewCell.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell, onDownloadCompletition {
        

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var repoNameUILabel: UILabel!
    @IBOutlet weak var repoCommitMessageUILabel: UILabel!
    
    var myIndexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func prepareForReuse() {
         self.repoCommitMessageUILabel.text = ""
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func setData(fromModel: Repository) {
        self.repoNameUILabel.text = fromModel.name ?? "Repository name unavailable"
    }
    
    func loadCommits(forViewModel: RepositoryViewModel, indexPath: Int) {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        forViewModel.fetchCommitTest { (isSuccess, commitModel) in
            self.onDownloadComplete(commitMessage: commitModel?.commitDetails?.message ?? "No Commit Message", cellIndex: indexPath)
        }
    }
    
    func onDownloadComplete(commitMessage: String, cellIndex: Int!) {
        if myIndexPath?.row == cellIndex {
            DispatchQueue.main.async {
                self.repoCommitMessageUILabel.text = commitMessage
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
    }

    
}

protocol onDownloadCompletition {
    func onDownloadComplete(commitMessage: String, cellIndex: Int!)
}
