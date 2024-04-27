//
//  PostDetailsViewModel.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import Foundation

import UIKit

class PostDetailsViewModel {
    var post: Post?
    
    func configureView(in view: UIView) {
        guard let post = post else {
            fatalError("Post not set")
        }
        
        let detailedView = UIView()
        view.addSubview(detailedView)
        detailedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            detailedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            detailedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            detailedView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -10)
        ])
        
        let nib = UINib(nibName: PostCell.identifier, bundle: nil)
        guard let postCell = nib.instantiate(withOwner: nil, options: nil).first as? PostCell else {
            fatalError("Unable to load PostCell from XIB")
        }
        
        postCell.translatesAutoresizingMaskIntoConstraints = false
        detailedView.addSubview(postCell)
        
        NSLayoutConstraint.activate([
            postCell.topAnchor.constraint(equalTo: detailedView.topAnchor, constant: 0),
            postCell.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 0),
            postCell.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: 0),
            postCell.bottomAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: 0)
        ])
        
        postCell.configure(post)
    }
}
