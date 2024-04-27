//
//  PostCell.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var postIDLabel: UILabel!
    
    static let identifier = "PostCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ post: Post?) {
        if let currentPost = post {
            titleLabel.text = currentPost.title
            descriptionLabel.text = currentPost.body
            postIDLabel.text = "\(currentPost.id)"
        }
        else {
            titleLabel.text = "No Post"
            descriptionLabel.text = "No Post"
        }
    }
}
