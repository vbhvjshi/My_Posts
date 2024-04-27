//
//  PostDetailsVC.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import UIKit

class PostDetailsVC: UIViewController {
    
    @IBOutlet weak var detailedView: UIView!
    
    var viewModel: PostDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {
            fatalError("ViewModel not set")
        }
        
        viewModel.configureView(in: detailedView)
    }
}
