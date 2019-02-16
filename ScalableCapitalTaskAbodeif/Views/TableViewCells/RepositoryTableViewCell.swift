//
//  RepositoryTableViewCell.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var repoNameUILabel: UILabel!
    @IBOutlet weak var repoCommitMessageUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(fromModel: RepositoryModel) {
        self.repoNameUILabel.text = fromModel.name ?? "Repository name unavailable"
    }
    
    func loadCommits(forViewModel: RepositoryViewModel) {
        print("in load commits")
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.center = self.containerView.center
        self.contentView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        forViewModel.fetchCommitTest { (isSuccess, commitModel) in
            if isSuccess {
                DispatchQueue.main.async {
                     self.repoCommitMessageUILabel.text = commitModel?.commitDetails?.message ?? "No Commit Message"
                }
            }
            else {
                self.repoCommitMessageUILabel.text = "No Commit Message"
            }
            activityIndicator.stopAnimating()
        }
    }
    
}
