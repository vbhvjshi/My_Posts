//
//  NetworkService.swift
//  Movie_App
//
//  Created by VAIBHAV JOSHI on 15/04/24.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    func fetchPosts(page: Int, completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = getURL(page: page)
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
 
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.networkError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let postsData = try decoder.decode([Post].self, from: data)
                completion(.success(postsData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

// Enum to represent network errors
enum NetworkError: Error {
    case invalidURL
    case networkError
}
