//
//  PostsViewModel.swift
//  My_Posts
//
//  Created by VAIBHAV JOSHI on 26/04/24.
//

import Foundation

class PostsViewModel {
    
    var posts: [Post] = []
    var currentPage: Int = 1
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        Loader.shared.show()
        APIService.shared.fetchPosts(page: currentPage) { result in
            DispatchQueue.main.async {
                Loader.shared.hide()
                switch result {
                case .success(let posts):
                    posts.forEach { post in
                        self.posts.append(post)
                    }
                    completion(.success(posts))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
