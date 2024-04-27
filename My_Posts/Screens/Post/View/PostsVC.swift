//
//  ViewController.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private weak var loadMoreButton: UIButton!
    @IBOutlet private weak var loadMoreView: UIView!
    
    let viewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        tableView.register(identifier: PostCell.identifier)
        fetchPosts()
    }
    
    func fetchPosts() {
        viewModel.fetchPosts() { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching posts: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func loadMoreAction(_ sender: UIButton) {
        self.getnewPosts()
    }
    
    func getnewPosts() {
        viewModel.currentPage += 1
        fetchPosts()
    }
}

extension PostsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if let posts = self.viewModel.posts as? [Post], posts.count != 0, let index = indexPath.item as? Int, let post = self.viewModel.posts[index] as? Post {
            cell.configure(post)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let index = indexPath.item as? Int else { return }
        loadMoreView.isHidden = (index == (self.viewModel.posts.count - 1)) ? false : true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let postDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.Detail_Page_Identifier) as? PostDetailsVC else { return }
        var postDetailModel = PostDetailsViewModel()
        postDetailModel.post = viewModel.posts[indexPath.row]
        postDetailsVC.viewModel = postDetailModel
        navigationController?.pushViewController(postDetailsVC, animated: true)
    }
}
