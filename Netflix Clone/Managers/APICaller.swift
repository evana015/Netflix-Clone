//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

struct Constants {
    static let API_KEY = "7502a13c57cecf92823b6e9f7424ef17"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(compeltion: @escaping(String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON Object
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
